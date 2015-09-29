#if defined SWIG

// Module name
%module GL

%{
#include "src/hact_gl.h"
%}

// OpenGL typedefs, defines and functions
//%include "swig_opengl.h"
%include "swig_gl3.h"

#endif // defined SWIG
