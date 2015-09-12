--
-- Fixes for some missing functionality in Uncrustify.
--

local config = {
    indentSize = 4;
}


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

-- Loop over the lines beginning to end
for i = 2, #lines do
    if lines[i]:find("^%s*%)") then
        -- Closing parenthesis of a function call
        
        -- Get indentation and remove one level of indentation
        local indent = lines[i - 1]:match("^(%s*)"):sub(1, -(config.indentSize + 1))
        
        -- Function call end (')' and everything after it)
        local callEnd = lines[i]:match("^%s*(%).*)")
        
        -- Replace line content
        lines[i] = indent .. callEnd
    end
end

-- Output the result
io.write(table.concat(lines, "\n"))
io.flush()
