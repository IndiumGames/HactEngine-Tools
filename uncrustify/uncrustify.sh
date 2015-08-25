#!/bin/bash

# Directory containing this script
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Run Uncrustify
Uncrustify "$@" > /tmp/uncrustify_output

# Re-indent empty lines
lua $DIR/reindent_file.lua /tmp/uncrustify_output

