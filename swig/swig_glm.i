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

%include <glm/detail/type_int.hpp>
%include <glm/detail/type_vec.hpp>

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
%define FLOAT_SCALAR_OR_VECTOR(function_name)
    float function_name(const float &);
    vec2  function_name(const vec2  &);
    vec3  function_name(const vec3  &);
    vec4  function_name(const vec4  &);
%enddef

%define FLOAT_SCALAR_OR_VECTOR_2_PARAMS(function_name)
    float function_name(const float &, const float &);
    vec2  function_name(const vec2  &, const vec2  &);
    vec3  function_name(const vec3  &, const vec3  &);
    vec4  function_name(const vec4  &, const vec4  &);
%enddef

%define FLOAT_SCALAR_OR_VECTOR_2_PARAMS_VECTOR_VALUE(function_name)
    vec2  function_name(const vec2  &, const float &);
    vec3  function_name(const vec3  &, const float &);
    vec4  function_name(const vec4  &, const float &);
%enddef

%define FLOAT_SCALAR_OR_VECTOR_3_PARAMS(function_name)
    float function_name(const float &, const float &, const float &);
    vec2  function_name(const vec2  &, const vec2  &, const vec2  &);
    vec3  function_name(const vec3  &, const vec3  &, const vec3  &);
    vec4  function_name(const vec4  &, const vec4  &, const vec4  &);
%enddef

%define FLOAT_SCALAR_OR_VECTOR_3_PARAMS_VECTOR_VALUE_VALUE(function_name)
    vec2  function_name(const vec2  &, const float &, const float &);
    vec3  function_name(const vec3  &, const float &, const float &);
    vec4  function_name(const vec4  &, const float &, const float &);
%enddef


// glm/detail/func_common.hpp
namespace glm {
    FLOAT_SCALAR_OR_VECTOR(abs)
    FLOAT_SCALAR_OR_VECTOR(sign)
    FLOAT_SCALAR_OR_VECTOR(floor)
    FLOAT_SCALAR_OR_VECTOR(trunc)
    FLOAT_SCALAR_OR_VECTOR(round)
    FLOAT_SCALAR_OR_VECTOR(roundEven)
    FLOAT_SCALAR_OR_VECTOR(ceil)
    FLOAT_SCALAR_OR_VECTOR(fract)
    FLOAT_SCALAR_OR_VECTOR_2_PARAMS(mod)
    FLOAT_SCALAR_OR_VECTOR_2_PARAMS_VECTOR_VALUE(mod)
    float modf(const float &, float &);
    vec2  modf(const vec2  &, vec2  &);
    vec3  modf(const vec3  &, vec3  &);
    vec4  modf(const vec4  &, vec4  &);
    FLOAT_SCALAR_OR_VECTOR_2_PARAMS(min)
    FLOAT_SCALAR_OR_VECTOR_2_PARAMS_VECTOR_VALUE(min)
    FLOAT_SCALAR_OR_VECTOR_2_PARAMS(max)
    FLOAT_SCALAR_OR_VECTOR_2_PARAMS_VECTOR_VALUE(max)
    FLOAT_SCALAR_OR_VECTOR_3_PARAMS(clamp)
    FLOAT_SCALAR_OR_VECTOR_3_PARAMS_VECTOR_VALUE_VALUE(clamp)
    //! mix()
    //FLOAT_SCALAR_OR_VECTOR_2_PARAMS(step)
    //! step()
    FLOAT_SCALAR_OR_VECTOR_3_PARAMS(smoothstep)
    vec2 smoothstep(const float &, const float &, const vec2 &);
    vec3 smoothstep(const float &, const float &, const vec3 &);
    vec4 smoothstep(const float &, const float &, const vec4 &);
    bool            isnan(const float &);
    vec2::bool_type isnan(const vec2 &);
    vec3::bool_type isnan(const vec3 &);
    vec4::bool_type isnan(const vec4 &);
    bool            isinf(const float &);
    vec2::bool_type isinf(const vec2 &);
    vec3::bool_type isinf(const vec3 &);
    vec4::bool_type isinf(const vec4 &);
    int floatBitsToInt(const float &);
    //! floatBitsToInt()
    uint floatBitsToUint(const float &);
    //! floatBitsToUint()
    float intBitsToFloat(const int &);
    //! intBitsToFloat()
    float uintBitsToFloat(const uint &);
    //! uintBitsToFloat()
    FLOAT_SCALAR_OR_VECTOR_3_PARAMS(fma)
    //! frexp()
    //! ldexp()
}

//%import "swig_glm/swig_glm_functions.i"

//%include <glm/detail/func_trigonometric.hpp>
//%include "swig_glm/detail/func_exponential.hpp"
//%include "swig_glm/detail/func_common.hpp"
//%include "swig_glm/detail/func_packing.hpp"
//%include "swig_glm/detail/func_geometric.hpp"
//%include "swig_glm/detail/func_matrix.hpp"
//%include "swig_glm/detail/func_vector_relational.hpp"
//%include <glm/detail/func_integer.hpp>

#endif // defined SWIG
