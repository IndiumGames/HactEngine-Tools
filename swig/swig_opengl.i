#if defined SWIG

// Module name
%module GL

%{
#include <QOpenGLFunctions>
%}

// OpenGL typedefs, defines and functions
//%include "swig_opengl.h"
%include "swig_gl3.h"

#endif // defined SWIG
