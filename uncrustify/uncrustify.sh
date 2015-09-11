#!/bin/bash

# Directory containing this script
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

for file in $DIR/../../src/*; do
    # Run Uncrustify
    uncrustify --no-backup -c "$DIR/uncrustify.cfg" "$file"
    
    # Re-indent empty lines
    lua "$DIR/reindent_file.lua" "$file" > "$file.new"
    
    mv "$file.new" "$file"
done
