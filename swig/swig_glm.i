// OpenGL Mathematics

#if defined SWIG

// Module name
%module GLM

%{
#include <stdexcept>
#include <string>
#include <sstream>

#include <iostream>

#define GLM_SWIZZLE
#include <glm/glm.hpp>
%}

// Exception support
%include <std_except.i>

// Types, macros, defines, etc.
%include <glm/detail/setup.hpp>
%include <glm/detail/precision.hpp>
%include <glm/detail/_swizzle_func.hpp>

// Rename operator functions
%rename(_operator_add) glm::detail::operator+;
%rename(_operator_sub) glm::detail::operator-;
%rename(_operator_mul) glm::detail::operator*;
%rename(_operator_div) glm::detail::operator/;
%rename(_operator_mod) glm::detail::operator%;


// Matrix types
%import "swig_glm/swig_glm_matrix.i"

GLM_MATRIX(mat2x2, glm::detail::tmat2x2, float, glm::highp)
GLM_MATRIX(mat2x3, glm::detail::tmat2x3, float, glm::highp)
GLM_MATRIX(mat2x4, glm::detail::tmat2x4, float, glm::highp)
GLM_MATRIX(mat3x2, glm::detail::tmat3x2, float, glm::highp)
GLM_MATRIX(mat3x3, glm::detail::tmat3x3, float, glm::highp)
GLM_MATRIX(mat3x4, glm::detail::tmat3x4, float, glm::highp)
GLM_MATRIX(mat4x2, glm::detail::tmat4x2, float, glm::highp)
GLM_MATRIX(mat4x3, glm::detail::tmat4x3, float, glm::highp)
GLM_MATRIX(mat4x4, glm::detail::tmat4x4, float, glm::highp)

// Vector types
%import "swig_glm/swig_glm_vector.i"

GLM_VECTOR(vec2, glm::detail::tvec2, float, glm::highp)
GLM_VECTOR(vec3, glm::detail::tvec3, float, glm::highp)
GLM_VECTOR(vec4, glm::detail::tvec4, float, glm::highp)

GLM_VECTOR(ivec2, glm::detail::tvec2, int, glm::highp)
GLM_VECTOR(ivec3, glm::detail::tvec3, int, glm::highp)
GLM_VECTOR(ivec4, glm::detail::tvec4, int, glm::highp)

GLM_VECTOR(bvec2, glm::detail::tvec2, bool, glm::highp)
GLM_VECTOR(bvec3, glm::detail::tvec3, bool, glm::highp)
GLM_VECTOR(bvec4, glm::detail::tvec4, bool, glm::highp)

// Operators
%template(operator_add) glm::detail::operator+<float, glm::highp>;
%template(operator_sub) glm::detail::operator-<float, glm::highp>;
%template(operator_mul) glm::detail::operator*<float, glm::highp>;
%template(operator_div) glm::detail::operator/<float, glm::highp>;

// In C++, the modulo operator isn't supported for floats
//%template(operator_mod) glm::detail::operator%<float, glm::highp>;

%template(operator_add) glm::detail::operator+<int, glm::highp>;
%template(operator_sub) glm::detail::operator-<int, glm::highp>;
%template(operator_mul) glm::detail::operator*<int, glm::highp>;
%template(operator_div) glm::detail::operator/<int, glm::highp>;
%template(operator_mod) glm::detail::operator%<int, glm::highp>;


// Functions
%include <glm/detail/func_trigonometric.hpp>
%include "swig_glm/detail/func_exponential.hpp"
%include "swig_glm/detail/func_common.hpp"
//%include "swig_glm/detail/func_packing.hpp"
%include "swig_glm/detail/func_geometric.hpp"
%include "swig_glm/detail/func_matrix.hpp"
%include "swig_glm/detail/func_vector_relational.hpp"
%include <glm/detail/func_integer.hpp>


#endif // defined SWIG
