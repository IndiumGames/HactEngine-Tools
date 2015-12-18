#if defined SWIG

// Module name
%module GL

%begin %{
    #if defined __GNUC__ && !defined __clang__
    // Ignore warnings in generated code (some minor bug in SWIG)
    #pragma GCC diagnostic ignored "-Wmaybe-uninitialized"
    #endif // defined __GNUC__ && !defined __clang__
%}

%{
    #include "src/hact_gl.h"
%}

// OpenGL typedefs, defines and functions
//%include "swig_opengl.h"
%include "swig_gl3.h"

#endif // defined SWIG
