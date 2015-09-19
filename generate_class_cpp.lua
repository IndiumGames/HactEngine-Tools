#!/usr/bin/env lua

--
-- Create a template for a C++ class
--

-- Class name
local className = arg[1] or error("No class name given.", 2)

-- Target directory
local targetDir = arg[2] or "src"

-- Add '/' to the end, if there isn't one
if targetDir:sub(-1, -1) ~= "/" then
    targetDir = targetDir .. "/"
end

-- Open the files
local header = assert(io.open(targetDir .. className:lower() .. ".h", "w"))
local source = assert(io.open(targetDir .. className:lower() .. ".cpp", "w"))


-- Header template
local headerTemplate = [[
#ifndef $class_uppercase$_H
#define $class_uppercase$_H


/*!>
 * $class$ class.
 */
class $class$ {
    public:
        $class$();
        
        $class$(const $class$ &) = delete;
        $class$($class$ &&) = delete;
        
        $class$ &operator =($class$) = delete;
    
    private:
        ...
};
#endif // $class_uppercase$_H

]]


-- Source template
local sourceTemplate = [[
#include "$class_lowercase$.h"


/*!
 * $class$ constructor.
 */
$class$::$class$() {}

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
