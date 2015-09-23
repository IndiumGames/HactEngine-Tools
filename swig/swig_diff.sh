#!/bin/bash

##
# swig_diff.sh
# 
# This script runs SWIG and compares the generated code with a previously
#  generated file, replacing the original only when necessary.
# 
# This way qmake doesn't unnecessarily recompile the generated code.
# 
# :param $1  Working directory (optional).
# 
# @author Sami Kankaristo <sami@indiumgames.fi>
# @since 2014-08-13
##


# The first parameter is used as the working directory
if [ -n "$1" ]; then
    cd $1
fi


# Run SWIG
#SWIG_LIB=../temp/_prefix/share/swig/3.0.8 ../temp/_prefix/bin/swig -c++ -lua -v -no-old-metatable-bindings -o swig_hact_wrap.temp swig_hact.i
#SWIG_LIB=../temp/_prefix/share/swig/3.0.8 ../temp/_prefix/bin/swig -c++ -lua -v -no-old-metatable-bindings -o swig_glm_wrap.temp swig_glm.i
#SWIG_LIB=../temp/_prefix/share/swig/3.0.8 ../temp/_prefix/bin/swig -c++ -lua -v -no-old-metatable-bindings -o swig_opengl_wrap.temp swig_opengl.i
swig3.0 -c++ -lua -v -no-old-metatable-bindings -o swig_hact_wrap.temp swig_hact.i
swig3.0 -c++ -lua -v -no-old-metatable-bindings -o swig_glm_wrap.temp swig_glm.i
swig3.0 -c++ -lua -v -no-old-metatable-bindings -o swig_opengl_wrap.temp swig_opengl.i


# 'swig_hact_wrap.cxx'
# Check if old output file exists
if [ -f swig_hact_wrap.cxx ]; then
    # Compare the new output file with the new
    if ! diff -q swig_hact_wrap.temp swig_hact_wrap.cxx > /dev/null; then
        # The files are different, replace the old with the new
        rm swig_hact_wrap.cxx
        mv swig_hact_wrap.temp swig_hact_wrap.cxx
    else
        # The files are the same, remove the temporary file
        rm swig_hact_wrap.temp
    fi
else
    # Old output file doesn't exist, so we don't need to do a diff
    mv swig_hact_wrap.temp swig_hact_wrap.cxx
fi


# 'swig_glm_wrap.cxx'
# Check if old output file exists
if [ -f swig_glm_wrap.cxx ]; then
    # Compare the new output file with the new
    if ! diff -q swig_glm_wrap.temp swig_glm_wrap.cxx > /dev/null; then
        # The files are different, replace the old with the new
        rm swig_glm_wrap.cxx
        mv swig_glm_wrap.temp swig_glm_wrap.cxx
    else
        # The files are the same, remove the temporary file
        rm swig_glm_wrap.temp
    fi
else
    # Old output file doesn't exist, so we don't need to do a diff
    mv swig_glm_wrap.temp swig_glm_wrap.cxx
fi


# 'swig_opengl_wrap.cxx'
# Check if old output file exists
if [ -f swig_opengl_wrap.cxx ]; then
    # Compare the new output file with the new
    if ! diff -q swig_opengl_wrap.temp swig_hact_wrap.cxx > /dev/null; then
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

