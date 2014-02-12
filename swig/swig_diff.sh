#!/bin/bash

if [[ -n "$1" ]]; then
    cd $1
fi

swig -c++ -lua -v -o swig_wrap.temp swig.i

if ! diff -q swig_wrap.temp swig_wrap.cxx > /dev/null ; then
    rm swig_wrap.cxx
    mv swig_wrap.temp swig_wrap.cxx
else
    rm swig_wrap.temp
fi
