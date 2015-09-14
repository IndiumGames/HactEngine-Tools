--
-- Indent empty lines in a file.
--

-- File name
local fileName = arg[1] or error("No file name given.", 2)

-- Open the file
local file = assert(io.open(fileName, "r"))

-- Read the file into a table
local lines = {}
for line in file:lines() do
    lines[#lines + 1] = line
end

-- Close the file
file:close()

-- Ensure there is (at least) one empty line at the end of the file
if lines[#lines] ~= "" then
    lines[#lines + 1] = ""
end

-- Loop over the lines from end to beginning
for i = #lines - 1, 1, -1 do
    -- Check that the current line is empty
    if lines[i]:find("^%s*$") then
        -- Write the indent on the next line to the current line
        lines[i] = lines[i + 1]:match("^(%s*)")
    end
end

-- TODO: Check that there are exactly 2 line changes at the end of the file?

-- Output the result
io.write(table.concat(lines, "\n"))
io.flush()
