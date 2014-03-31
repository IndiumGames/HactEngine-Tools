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


# Run SWIG
swig -c++ -lua -v -o swig_wrap.temp swig.i
swig -c++ -lua -v -o swig_opengl_wrap.temp swig_opengl.i


# 'swig_wrap.cxx'
# Check if old output file exists
if [ -f swig_wrap.cxx ]; then
    # Compare the new output file with the new
    if ! diff -q swig_wrap.temp swig_wrap.cxx > /dev/null; then
        # The files are different, replace the old with the new
        rm swig_wrap.cxx
        mv swig_wrap.temp swig_wrap.cxx
    else
        # The files are the same, remove the temporary file
        rm swig_wrap.temp
    fi
else
    # Old output file doesn't exist, so we don't need to do a diff
    mv swig_wrap.temp swig_wrap.cxx
fi


# 'swig_opengl_wrap.cxx'
# Check if old output file exists
if [ -f swig_opengl_wrap.cxx ]; then
    # Compare the new output file with the new
    if ! diff -q swig_opengl_wrap.temp swig_wrap.cxx > /dev/null; then
        # The files are different, replace the old with the new
        rm swig_opengl_wrap.cxx
        mv swig_opengl_wrap.temp swig_opengl_wrap.cxx
    else
        # The files are the same, remove the temporary file
        rm swig_opengl_wrap.temp
    fi
else
    # Old output file doesn't exist, so we don't need to do a diff
    mv swig_opengl_wrap.temp swig_opengl_wrap.cxx
fi
