#!/usr/bin/env lua

--
-- Create a template for a Lua class
--

-- Class name
local className = arg[1] or error("No class name given.", 2)

-- Target directory
local targetDir = arg[2] or "."

-- Add '/' to the end, if there isn't one
if targetDir:sub(-1, -1) ~= "/" then
    targetDir = targetDir .. "/"
end

-- Open the files
local header = assert(io.open(targetDir .. className .. ".lua", "w"))
local source = assert(io.open(targetDir .. className .. "_def.lua", "w"))


-- Header template
local headerTemplate = [[
--!>
--! $class$ class.
--!
class $class$ {
    public {
        "_constructor";
    }
    
    private {
        ...
    }
}

]]


-- Source template
local sourceTemplate = [[
-- $class$ definitions


local $class$ = {}


--!
--! $class$ constructor.
--!
function $class$:_constructor()
    return self
end


return $class$

]]


-- Replace the class name from the templates
headerTemplate = headerTemplate:gsub("%$class%$",           className)
headerTemplate = headerTemplate:gsub("%$class_lowercase%$", className:lower())
headerTemplate = headerTemplate:gsub("%$class_uppercase%$", className:upper())
sourceTemplate = sourceTemplate:gsub("%$class%$",           className)
sourceTemplate = sourceTemplate:gsub("%$class_lowercase%$", className:lower())
sourceTemplate = sourceTemplate:gsub("%$class_uppercase%$", className:upper())


-- Write the header file
header:write(headerTemplate)
header:close()

-- Write the source file
source:write(sourceTemplate)
source:close()
