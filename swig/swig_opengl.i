#if defined SWIG

// Module name
%module GL

%begin %{
    // Ignore warnings in generated code (some minor bug in SWIG)
    #if defined __clang__
    #pragma clang diagnostic ignored "-Wmaybe-uninitialized"
    #pragma clang diagnostic ignored "-Werror=maybe-uninitialized"
    #elif defined __GNUC__
    #pragma GCC diagnostic ignored "-Wmaybe-uninitialized"
    #pragma GCC diagnostic ignored "-Werror=maybe-uninitialized"
    #endif // defined __clang__
%}

%{
    #include "src/hact_gl.h"
%}

// OpenGL typedefs, defines and functions
//%include "swig_opengl.h"
%include "swig_gl3.h"

#endif // defined SWIG
