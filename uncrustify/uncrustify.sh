#!/bin/bash

# Directory containing this script
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Loop over headers
for file in $DIR/../../src/*.h; do
    # Run Uncrustify
    uncrustify --no-backup -c "$DIR/uncrustify_header.cfg" "$file"
done


# Loop over definition files
for file in $DIR/../../src/*.cpp; do
    # Run Uncrustify
    uncrustify --no-backup -c "$DIR/uncrustify.cfg" "$file"
done


# Loop over all files
for file in $DIR/../../src/*; do
    # Run Uncrustify
    #uncrustify --no-backup -c "$DIR/uncrustify.cfg" "$file"
    
    # Fix some missing Uncrustify features
    lua "$DIR/uncrustify_fixes.lua" "$file" > "$file.fix"
    
    # Re-indent empty lines
    lua "$DIR/reindent_file.lua" "$file.fix" > "$file"
    
    #mv "$file.new" "$file"
    
    # Remove temporary files
    rm "$file.fix"
done
