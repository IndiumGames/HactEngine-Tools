local luacheck = require "luacheck"
local argparse = require "luacheck.argparse"
local config = require "luacheck.config"
local options = require "luacheck.options"
local expand_rockspec = require "luacheck.expand_rockspec"
local multithreading = require "luacheck.multithreading"
local cache = require "luacheck.cache"
local format = require "luacheck.format"
local version = require "luacheck.version"
local fs = require "luacheck.fs"
local globbing = require "luacheck.globbing"
local utils = require "luacheck.utils"

local function critical(msg)
   io.stderr:write("Critical error: "..msg.."\n")
   os.exit(3)
end

local function global_error_handler(err)
   if type(err) == "table" and err.pattern then
      critical("Invalid pattern '" .. err.pattern .. "'")
   else
      critical(debug.traceback(
         ("Luacheck %s bug (please report at github.com/mpeterv/luacheck/issues):\n%s"):format(luacheck._VERSION, err), 2))
   end
end

local function main()
   local default_cache_path = ".luacheckcache"

   local function get_parser()
      local parser = argparse("luacheck", "luacheck " .. luacheck._VERSION .. ", a simple static analyzer for Lua.", [[
Links:

   Luacheck on GitHub: https://github.com/mpeterv/luacheck
   Luacheck documentation: http://luacheck.readthedocs.org]])

      parser:argument "files"
         :description (fs.has_lfs and [[List of files, directories and rockspecs to check.
Pass "-" to check stdin.]] or [[List of files and rockspecs to check.
Pass "-" to check stdin.]])
         :args "+"
         :argname "<file>"

      parser:flag("-g --no-global", [[Filter out warnings related to global variables.
Equivalent to --ignore 1.]])
      parser:flag("-u --no-unused", [[Filter out warnings related to unused variables
and values. Equivalent to --ignore [23].]])
      parser:flag("-r --no-redefined", [[Filter out warnings related to redefined variables.
Equivalent to --ignore 4.]])

      parser:flag("-a --no-unused-args", [[Filter out warnings related to unused arguments and
loop variables. Equivalent to --ignore 21[23].]])
      parser:flag("-s --no-unused-secondaries", [[Filter out warnings related to unused variables set
together with used ones.]])
      parser:flag("--no-self", "Filter out warnings related to implicit self argument.")

      parser:option("--std", [[Set standard globals. <std> can be one of:
   _G (default) - globals of the current Lua
      interpreter;
   lua51 - globals of Lua 5.1;
   lua52 - globals of Lua 5.2;
   lua52c - globals of Lua 5.2 with LUA_COMPAT_ALL;
   lua53 - globals of Lua 5.3;
   lua53c - globals of Lua 5.3 with LUA_COMPAT_5_2;
   luajit - globals of LuaJIT 2.0;
   ngx_lua - globals of Openresty lua-nginx-module with LuaJIT 2.0;
   min - intersection of globals of Lua 5.1, Lua 5.2,
      Lua 5.3 and LuaJIT 2.0;
   max - union of globals of Lua 5.1, Lua 5.2, Lua 5.3
      and LuaJIT 2.0;
   busted - globals added by Busted 2.0;
   none - no standard globals.

   Sets can be combined using "+".]])
      parser:option("--globals", "Add custom globals on top of standard ones.")
         :args "*"
         :count "*"
         :argname "<global>"
      parser:option("--read-globals", "Add read-only globals.")
         :args "*"
         :count "*"
         :argname "<global>"
      parser:option("--new-globals", [[Set custom globals. Removes custom globals added
previously.]])
         :args "*"
         :count "*"
         :argname "<global>"
      parser:option("--new-read-globals", [[Set read-only globals. Removes read-only globals added
previously.]])
         :args "*"
         :count "*"
         :argname "<global>"
      parser:flag("-c --compat", "Equivalent to --std max.")
      parser:flag("-d --allow-defined", "Allow defining globals implicitly by setting them.")
      parser:flag("-t --allow-defined-top", [[Allow defining globals implicitly by setting them in
the top level scope.]])
      parser:flag("-m --module", [[Limit visibility of implicitly defined globals to
their files.]])

      parser:option("--ignore -i", [[Filter out warnings matching these patterns.
If a pattern contains slash, part before slash matches
warning code and part after it matches name of related
variable. Otherwise, if the pattern contains letters
or underscore, it matches name of related variable.
Otherwise, the pattern matches warning code.]])
         :args "+"
         :count "*"
         :argname "<patt>"
      parser:option("--enable -e", "Do not filter out warnings matching these patterns.")
         :args "+"
         :count "*"
         :argname "<patt>"
      parser:option("--only -o", "Filter out warnings not matching these patterns.")
         :args "+"
         :count "*"
         :argname "<patt>"

      parser:flag("--no-inline", "Disable inline options.")

      parser:mutex(
         parser:option("--config", "Path to configuration file. (default: "..config.default_path..")"),
         parser:flag("--no-config", "Do not look up configuration file.")
      )

      parser:option("--filename", [[Use another filename in output and for selecting
configuration overrides.]])

      parser:option("--exclude-files", "Do not check files matching these globbing patterns.")
         :args "+"
         :count "*"
         :argname "<glob>"
      parser:option("--include-files", [[Do not check files not matching these globbing
patterns.]])
         :args "+"
         :count "*"
         :argname "<glob>"

      if fs.has_lfs then
         parser:mutex(
            parser:option("--cache", "Path to cache file.", default_cache_path)
               :defmode "arg",
            parser:flag("--no-cache", "Do not use cache.")
         )
      end

      if multithreading.has_lanes then
         parser:option("-j --jobs", "Check <jobs> files in parallel.")
            :convert(tonumber)
      end

      parser:option("--formatter" , [[Use custom formatter.
<formatter> must be a module name or one of:
   TAP - Test Anything Protocol formatter;
   JUnit - JUnit XML formatter;
   plain - simple warning-per-line formatter;
   default - standard formatter.]])

      parser:flag("-q --quiet", [[Suppress output for files without warnings.
   -qq: Suppress output of warnings.
   -qqq: Only print total number of warnings and
      errors.]])
         :count "0-3"

      parser:flag("--codes", "Show warning codes.")
      parser:flag("--ranges", "Show ranges of columns related to warnings.")
      parser:flag("--no-color", "Do not color output.")

      parser:flag("-v --version", "Show version info and exit.")
         :action(function() print(version.string) os.exit(0) end)

      return parser
   end

   local function match_any(globs, name)
      for _, glob in ipairs(globs) do
         if globbing.match(glob, name) then
            return true
         end
      end

      return false
   end

   local function is_included(args, name)
      return not match_any(args.exclude_files, name) and (#args.include_files == 0 or match_any(args.include_files, name))
   end

   -- Expands folders, rockspecs, -
   -- Returns new array of filenames and table mapping indexes of bad rockspecs to error messages.
   -- Removes "./" in the beginnings of file names.
   -- Filters filenames using args.exclude_files and args.include_files.
   local function expand_files(args)
      local res, bad_rockspecs = {}, {}

      local function add(file)
         if type(file) == "string" then
            file = file:gsub("^./", "")
         end

         local name = args.filename or file

         if type(name) == "string" then
            if not is_included(args, name) then
               return false
            end
         end

         table.insert(res, file)
         return true
      end

      for _, file in ipairs(args.files) do
         if file == "-" then
            add(io.stdin)
         elseif fs.is_dir(file) then
            for _, nested_file in ipairs(fs.extract_files(file, "%.lua$")) do
               add(nested_file)
            end
         elseif file:sub(-#".rockspec") == ".rockspec" then
            local related_files, err = expand_rockspec(file)

            if related_files then
               for _, related_file in ipairs(related_files) do
                  add(related_file)
               end
            else
               if add(file) then
                  bad_rockspecs[#res] = err
               end
            end
         else
            add(file)
         end
      end

      return res, bad_rockspecs
   end

   local function validate_args(args, parser)
      if args.jobs and args.jobs < 1 then
         parser:error("<jobs> must be at least 1")
      end

      if args.std and not options.split_std(args.std) then
         parser:error("<std> must name a standard library")
      end
   end

   local function get_options(args)
      local res = {}

      for _, argname in ipairs {"allow_defined", "allow_defined_top", "module", "compat", "std"} do
         if args[argname] then
            res[argname] = args[argname]
         end
      end

      for _, argname in ipairs {"global", "unused", "redefined", "unused", "unused_args",
            "unused_secondaries", "self", "inline"} do
         if args["no_"..argname] then
            res[argname] = false
         end
      end

      for _, argname in ipairs {"globals", "read_globals", "new_globals", "new_read_globals",
            "ignore", "enable", "only"} do
         if #args[argname] > 0 then
            res[argname] = utils.concat_arrays(args[argname])
         end
      end

      return res
   end

   local function combine_conf_and_args_path_arrays(conf, args, option)
      local conf_opts = config.get_top_options(conf)

      if conf_opts[option] then
         for i, path in ipairs(conf_opts[option]) do
            conf_opts[option][i] = config.relative_path(conf, path)
         end

         table.insert(args[option], conf_opts[option])
      end

      args[option] = utils.concat_arrays(args[option])
   end

   -- Applies cli-specific options from config to args.
   local function combine_config_and_args(conf, args)
      local conf_opts = config.get_top_options(conf)

      if args.no_color then
         args.color = false
      else
         args.color = conf_opts.color ~= false
      end

      args.codes = args.codes or conf_opts.codes
      args.formatter = args.formatter or conf_opts.formatter or "default"

      if args.no_cache or not fs.has_lfs then
         args.cache = false
      elseif not args.cache then
         if type(conf_opts.cache) == "string" then
            args.cache = config.relative_path(conf, conf_opts.cache)
         else
            args.cache = conf_opts.cache
         end
      end

      if args.cache == true then
         args.cache = config.relative_path(conf, default_cache_path)
      end

      args.jobs = args.jobs or conf_opts.jobs

      combine_conf_and_args_path_arrays(conf, args, "exclude_files")
      combine_conf_and_args_path_arrays(conf, args, "include_files")
   end

   -- Returns sparse array of mtimes and map of filenames to cached reports.
   local function get_mtimes_and_cached_reports(cache_filename, files, bad_files)
      local cache_files = {}
      local cache_mtimes = {}
      local sparse_mtimes = {}

      for i, file in ipairs(files) do
         if not bad_files[i] and file ~= io.stdin then
            table.insert(cache_files, file)
            local mtime = fs.mtime(file)
            table.insert(cache_mtimes, mtime)
            sparse_mtimes[i] = mtime
         end
      end

      return sparse_mtimes, cache.load(cache_filename, cache_files, cache_mtimes) or critical(
         ("Couldn't load cache from %s: data corrupted"):format(cache_filename))
   end

   -- Returns sparse array of sources of files that need to be checked, updates bad_files with files that had I/O issues.
   local function get_srcs_to_check(cached_reports, files, bad_files)
      local res = {}

      for i, file in ipairs(files) do
         if not bad_files[i] and not cached_reports[file] then
            local src = utils.read_file(file)

            if src then
               res[i] = src
            else
               bad_files[i] = "I/O"
            end
         end
      end

      return res
   end

   -- Returns sparse array of new reports.
   local function get_new_reports(files, srcs, jobs)
      local dense_srcs = {}
      local dense_to_sparse = {}

      for i in ipairs(files) do
         if srcs[i] then
            table.insert(dense_srcs, srcs[i])
            dense_to_sparse[#dense_srcs] = i
         end
      end

      local map = jobs and multithreading.has_lanes and multithreading.pmap or utils.map
      local dense_res = map(luacheck.get_report, dense_srcs, jobs)

      local res = {}

      for i in ipairs(dense_srcs) do
         res[dense_to_sparse[i]] = dense_res[i]
      end

      return res
   end

   -- Updates cache with new_reports. Updates bad_files for which mtime is absent.
   local function update_cache(cache_filename, files, bad_files, srcs, mtimes, new_reports)
      local cache_files = {}
      local cache_mtimes = {}
      local cache_reports = {}

      for i, file in ipairs(files) do
         if srcs[i] and file ~= io.stdin then
            if not mtimes[i] then
               bad_files[i] = "I/O"
            else
               table.insert(cache_files, file)
               table.insert(cache_mtimes, mtimes[i])
               table.insert(cache_reports, new_reports[i] or false)
            end
         end
      end

      return cache.update(cache_filename, cache_files, cache_mtimes, cache_reports) or critical(
         ("Couldn't save cache to %s: I/O error"):format(cache_filename))
   end

   -- Returns array of reports for files.
   local function get_reports(cache_filename, files, bad_rockspecs, jobs)
      local bad_files = utils.update({}, bad_rockspecs)
      local mtimes
      local cached_reports

      if cache_filename then
         mtimes, cached_reports = get_mtimes_and_cached_reports(cache_filename, files, bad_files)
      else
         cached_reports = {}
      end

      local srcs = get_srcs_to_check(cached_reports, files, bad_files)
      local new_reports = get_new_reports(files, srcs, jobs)

      if cache_filename then
         update_cache(cache_filename, files, bad_files, srcs, mtimes, new_reports)
      end

      local res = {}

      for i, file in ipairs(files) do
         if bad_files[i] then
            res[i] = {fatal = bad_files[i]}
         else
            res[i] = cached_reports[file] or new_reports[i]
         end
      end

      return res
   end

   local function combine_config_and_options(conf, cli_opts, files)
      local res = {}

      for i, file in ipairs(files) do
         res[i] = config.get_options(conf, file)
         table.insert(res[i], cli_opts)
      end

      return res
   end

   local function substitute_filename(new_filename, files)
      if new_filename then
         for i = 1, #files do
            files[i] = new_filename
         end
      end
   end

   local function normalize_stdin_in_filenames(files)
      for i, file in ipairs(files) do
         if type(file) ~= "string" then
            files[i] = "stdin"
         end
      end
   end

   local builtin_formatters = utils.array_to_set({"TAP", "JUnit", "plain", "default"})

   local function pformat(report, file_names, conf, args)
      if builtin_formatters[args.formatter] then
         return format.format(report, file_names, args)
      end

      local formatter = args.formatter
      local ok, output

      if type(formatter) == "string" then
         ok, formatter = config.relative_require(conf, formatter)

         if not ok then
            critical(("Couldn't load custom formatter '%s': %s"):format(args.formatter, formatter))
         end
      end

      ok, output = pcall(formatter, report, file_names, args)

      if not ok then
         critical(("Couldn't run custom formatter '%s': %s"):format(tostring(args.formatter), output))
      end

      return output
   end

   local parser = get_parser()
   local args = parser:parse()
   local opts = get_options(args)
   local conf

   if args.no_config then
      conf = config.empty_config
   else
      local err
      conf, err = config.load_config(args.config)

      if not conf then
         critical(err)
      end
   end

   -- Validate args only after loading config so that custom stds are already in place.
   validate_args(args, parser)
   combine_config_and_args(conf, args)

   local files, bad_rockspecs = expand_files(args)
   local reports = get_reports(args.cache, files, bad_rockspecs, args.jobs)
   substitute_filename(args.filename, files)
   local report = luacheck.process_reports(reports, combine_config_and_options(conf, opts, files))
   normalize_stdin_in_filenames(files)

   local output = pformat(report, files, conf, args)

   if #output > 0 and output:sub(-1) ~= "\n" then
      output = output .. "\n"
   end

   io.stdout:write(output)

   local exit_code

   if report.fatals > 0 then
      exit_code = 2
   elseif report.warnings > 0 or report.errors > 0 then
      exit_code = 1
   else
      exit_code = 0
   end

   os.exit(exit_code)
end

xpcall(main, global_error_handler)
