#!/bin/bash

# Directory containing this script
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Loop over headers
for file in $DIR/../src/*.h; do
    # Run Uncrustify
    uncrustify --no-backup -c "$DIR/uncrustify/uncrustify_header.cfg" "$file"
done


# Loop over definition files
for file in $DIR/../src/*.cpp; do
    # Run Uncrustify
    uncrustify --no-backup -c "$DIR/uncrustify/uncrustify.cfg" "$file"
done


# Prettify C++ files
for file in $DIR/../src/*; do
    # Fix some missing Uncrustify features
    lua "$DIR/uncrustify/uncrustify_fixes.lua" "$file" > "$file.fix"
    
    # Re-indent empty lines
    lua "$DIR/reindent_file.lua" "$file.fix" > "$file"
    
    # Remove temporary files
    rm "$file.fix"
done


# Prettify Lua files
for file in $DIR/../**/*.lua; do
    # Re-indent empty lines
    lua "$DIR/reindent_file.lua" "$file" > "$file.new"
    
    mv "$file.new" "$file"
done

