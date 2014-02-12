#!/bin/bash

##
# swig_diff.sh
# 
# This script runs SWIG and compares the generated code with a previously
#  generated file, replacing the original only when necessary.
# 
# This way qmake doesn't unnecessarily recompile the generated code.
# 
# @param $1  Working directory (optional).
# 
# @author Sami Kankaristo <sami@indiumgames.fi>
# @since 2014-02-12
##


# The first parameter is used as the working directory
if [ -n "$1" ]; then
    cd $1
fi

# Run SWIG with 'swig.i' and generate code into 'swig_wrap.temp'
swig -c++ -lua -v -o swig_wrap.temp swig.i

# Check if 'swig_wrap.cxx' doesn't exist
if [ ! -f swig_wrap.cxx ]; then
    # 'swig_wrap.cxx' doesn't exist, so we don't need to do a diff
    mv swig_wrap.temp swig_wrap.cxx
    exit
fi

# Compare 'swig_wrap.temp' and 'swig_wrap.cxx'
if [ ! diff -q swig_wrap.temp swig_wrap.cxx > /dev/null ]; then
    # The files are different, replace 'swig_wrap.cxx' with 'swig_wrap.temp'
    rm swig_wrap.cxx
    mv swig_wrap.temp swig_wrap.cxx
else
    # The files are the same, remove the temporary file
    rm swig_wrap.temp
fi
