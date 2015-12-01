#if defined SWIG

// Module name
%module GL

%begin %{
    // Ignore warnings in release builds
    // FIXME: Get this to work :(
    //#pragma GCC diagnostic ignored "-Wmaybe-uninitialized"
%}

%{
    #include "src/hact_gl.h"
%}

// OpenGL typedefs, defines and functions
//%include "swig_opengl.h"
%include "swig_gl3.h"

#endif // defined SWIG
