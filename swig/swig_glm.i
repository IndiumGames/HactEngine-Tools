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
%include <glm/detail/type_vec.hpp>
%include "swig_glm/detail/type_mat.hpp"

// Rename operator functions
%rename(_operator_add) glm::detail::operator+;
%rename(_operator_sub) glm::detail::operator-;
%rename(_operator_mul) glm::detail::operator*;
%rename(_operator_div) glm::detail::operator/;



/***************
* MATRIX TYPES *
***************/

%include "swig_glm/detail/type_mat2x2.hpp"
%include "swig_glm/detail/type_mat2x3.hpp"
%include "swig_glm/detail/type_mat2x4.hpp"
%include "swig_glm/detail/type_mat3x2.hpp"
%include "swig_glm/detail/type_mat3x3.hpp"
%include "swig_glm/detail/type_mat3x4.hpp"
%include "swig_glm/detail/type_mat4x2.hpp"
%include "swig_glm/detail/type_mat4x3.hpp"
%include "swig_glm/detail/type_mat4x4.hpp"

%define GLM_MATRIX(lua_type, glm_class, glm_type, glm_precision)
%extend glm_class {
    // [] is replaced by __getitem__ & __setitem__
    // Simply throws a string, which causes a Lua error
    col_type __getitem__(glm::length_t idx) throw (std::out_of_range) {
        if (idx >= self->length()) {
            throw std::out_of_range("in classname::__getitem__()");
        }
        
        return (*self)[idx];
    }
    void __setitem__(glm::length_t idx, col_type val) throw (std::out_of_range) {
        if (idx >= self->length()) {
            throw std::out_of_range("in classname::__setitem__()");
        }
        
        (*self)[idx] = val;
    }
    
    const char* __str__() {
        std::stringstream stringStream;
        
        const glm::length_t width = $self->length();
        const glm::length_t height = (*$self)[0].length();
        
        for (glm::length_t row = 0; row < height; ++row) {
            for (glm::length_t col = 0; col < width; ++col) {
                stringStream << (*$self)[col][row];
                
                if (col + 1 != width) {
                    stringStream << ",\t";
                }
            }
            
            if (row + 1 != height) {
                stringStream << "\n";
            }
        }
        
        return stringStream.str().c_str();
    }
};

%template(lua_type) glm_class<glm_type, glm_precision>;
%enddef

GLM_MATRIX(mat2x2, glm::detail::tmat2x2, float, glm::highp)
GLM_MATRIX(mat2x3, glm::detail::tmat2x3, float, glm::highp)
GLM_MATRIX(mat2x4, glm::detail::tmat2x4, float, glm::highp)
GLM_MATRIX(mat3x2, glm::detail::tmat3x2, float, glm::highp)
GLM_MATRIX(mat3x3, glm::detail::tmat3x3, float, glm::highp)
GLM_MATRIX(mat3x4, glm::detail::tmat3x4, float, glm::highp)
GLM_MATRIX(mat4x2, glm::detail::tmat4x2, float, glm::highp)
GLM_MATRIX(mat4x3, glm::detail::tmat4x3, float, glm::highp)
GLM_MATRIX(mat4x4, glm::detail::tmat4x4, float, glm::highp)



/***************
* VECTOR TYPES *
***************/

%include "swig_glm/detail/type_vec2.hpp"
%include "swig_glm/detail/type_vec3.hpp"
%include "swig_glm/detail/type_vec4.hpp"

%define GLM_VECTOR(lua_type, glm_class, glm_type, glm_precision)
%extend glm_class {
    // [] is replaced by __getitem__ & __setitem__
    // Simply throws a string, which causes a Lua error
    T __getitem__(glm::length_t idx) throw (std::out_of_range) {
        if (idx >= $self->length()) {
            throw std::out_of_range("in classname::__getitem__()");
        }
        
        return (*$self)[idx];
    }
    void __setitem__(glm::length_t idx, T val) throw (std::out_of_range) {
        if (idx >= $self->length()) {
            throw std::out_of_range("in classname::__setitem__()");
        }
        
        (*$self)[idx] = val;
    }
    
    const char* __str__() {
        std::stringstream stringStream;
        
        for (glm::length_t i = 0; i < $self->length(); ++i) {
            stringStream << (*$self)[i];
            
            if (i + 1 != $self->length()) {
                stringStream << ", ";
            }
        }
        
        return stringStream.str().c_str();
    }
};

%template(lua_type) glm_class<glm_type, glm_precision>;
%enddef

GLM_VECTOR(vec2, glm::detail::tvec2, float, glm::highp)
GLM_VECTOR(vec3, glm::detail::tvec3, float, glm::highp)
GLM_VECTOR(vec4, glm::detail::tvec4, float, glm::highp)

//GLM_VECTOR(ivec2, glm::detail::tvec2, int, glm::highp)
//GLM_VECTOR(ivec3, glm::detail::tvec3, int, glm::highp)
//GLM_VECTOR(ivec4, glm::detail::tvec4, int, glm::highp)
//GLM_VECTOR(uvec2, glm::detail::tvec2, uint, glm::highp)
//GLM_VECTOR(uvec3, glm::detail::tvec3, uint, glm::highp)
//GLM_VECTOR(uvec4, glm::detail::tvec4, uint, glm::highp)

GLM_VECTOR(bvec2, glm::detail::tvec2, bool, glm::highp)
GLM_VECTOR(bvec3, glm::detail::tvec3, bool, glm::highp)
GLM_VECTOR(bvec4, glm::detail::tvec4, bool, glm::highp)



/************
* OPERATORS *
*************/

%template(operator_add) glm::detail::operator+<float, glm::highp>;
%template(operator_sub) glm::detail::operator-<float, glm::highp>;
%template(operator_mul) glm::detail::operator*<float, glm::highp>;
%template(operator_div) glm::detail::operator/<float, glm::highp>;



/************
* FUNCTIONS *
************/

%define FLOAT_VECTOR(function_name)
    vec2 function_name(const vec2 &);
    vec3 function_name(const vec3 &);
    vec4 function_name(const vec4 &);
%enddef

%define FLOAT_VECTOR_2_PARAMS(function_name)
    vec2 function_name(const vec2 &, const vec2 &);
    vec3 function_name(const vec3 &, const vec3 &);
    vec4 function_name(const vec4 &, const vec4 &);
%enddef

%define FLOAT_VECTOR_3_PARAMS(function_name)
    vec2 function_name(const vec2 &, const vec2 &, const vec2 &);
    vec3 function_name(const vec3 &, const vec3 &, const vec3 &);
    vec4 function_name(const vec4 &, const vec4 &, const vec4 &);
%enddef

%define FLOAT_VECTOR_RETURN_VALUE(function_name)
    float function_name(const vec2 &);
    float function_name(const vec3 &);
    float function_name(const vec4 &);
%enddef

%define FLOAT_VECTOR_RETURN_VALUE_2_PARAMS(function_name)
    float function_name(const vec2 &, const vec2 &);
    float function_name(const vec3 &, const vec3 &);
    float function_name(const vec4 &, const vec4 &);
%enddef

%define FLOAT_SCALAR_OR_VECTOR(function_name)
    float function_name(const float &);
    vec2  function_name(const vec2  &);
    vec3  function_name(const vec3  &);
    vec4  function_name(const vec4  &);
%enddef

%define FLOAT_SCALAR_OR_VECTOR_RETURN_VALUE(function_name)
    float function_name(const float &);
    float function_name(const vec2  &);
    float function_name(const vec3  &);
    float function_name(const vec4  &);
%enddef

%define FLOAT_SCALAR_OR_VECTOR_2_PARAMS(function_name)
    float function_name(const float &, const float &);
    vec2  function_name(const vec2  &, const vec2  &);
    vec3  function_name(const vec3  &, const vec3  &);
    vec4  function_name(const vec4  &, const vec4  &);
%enddef

%define FLOAT_SCALAR_OR_VECTOR_2_PARAMS_VECTOR_VALUE(function_name)
    vec2 function_name(const vec2 &, const float &);
    vec3 function_name(const vec3 &, const float &);
    vec4 function_name(const vec4 &, const float &);
%enddef

%define FLOAT_SCALAR_OR_VECTOR_3_PARAMS(function_name)
    float function_name(const float &, const float &, const float &);
    vec2  function_name(const vec2  &, const vec2  &, const vec2  &);
    vec3  function_name(const vec3  &, const vec3  &, const vec3  &);
    vec4  function_name(const vec4  &, const vec4  &, const vec4  &);
%enddef

%define FLOAT_SCALAR_OR_VECTOR_3_PARAMS_VECTOR_VALUE_VALUE(function_name)
    vec2 function_name(const vec2 &, const float &, const float &);
    vec3 function_name(const vec3 &, const float &, const float &);
    vec4 function_name(const vec4 &, const float &, const float &);
%enddef


// glm/detail/func_common.hpp
%define DECLARE_FUNC_COMMON()
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
    //float modf(const float &, float &);
    //vec2  modf(const vec2  &, vec2  &);
    //vec3  modf(const vec3  &, vec3  &);
    //vec4  modf(const vec4  &, vec4  &);
    FLOAT_SCALAR_OR_VECTOR_2_PARAMS(min)
    FLOAT_SCALAR_OR_VECTOR_2_PARAMS_VECTOR_VALUE(min)
    FLOAT_SCALAR_OR_VECTOR_2_PARAMS(max)
    FLOAT_SCALAR_OR_VECTOR_2_PARAMS_VECTOR_VALUE(max)
    FLOAT_SCALAR_OR_VECTOR_3_PARAMS(clamp)
    FLOAT_SCALAR_OR_VECTOR_3_PARAMS_VECTOR_VALUE_VALUE(clamp)
    float mix(const float &, const float &, const float &);
    float mix(const float &, const float &, const bool  &);
    vec2  mix(const vec2  &, const vec2  &, const vec2  &);
    vec3  mix(const vec3  &, const vec3  &, const vec3  &);
    vec4  mix(const vec4  &, const vec4  &, const vec4  &);
    vec2  mix(const vec2  &, const vec2  &, const bool &);
    vec3  mix(const vec3  &, const vec3  &, const bool &);
    vec4  mix(const vec4  &, const vec4  &, const bool &);
    vec2  mix(const vec2  &, const vec2  &, const detail::tvec2<bool, highp> &);
    vec3  mix(const vec3  &, const vec3  &, const detail::tvec3<bool, highp> &);
    vec4  mix(const vec4  &, const vec4  &, const detail::tvec4<bool, highp> &);
    vec2  step(const vec2  &, const vec2 &);
    vec3  step(const vec3  &, const vec3 &);
    vec4  step(const vec4  &, const vec4 &);
    vec2  step(const float &, const vec2 &);
    vec3  step(const float &, const vec3 &);
    vec4  step(const float &, const vec4 &);
    FLOAT_SCALAR_OR_VECTOR_3_PARAMS(smoothstep)
    vec2  smoothstep(const float &, const float &, const vec2 &);
    vec3  smoothstep(const float &, const float &, const vec3 &);
    vec4  smoothstep(const float &, const float &, const vec4 &);
    bool  isnan(const float &);
    bvec2 isnan(const vec2 &);
    bvec3 isnan(const vec3 &);
    bvec4 isnan(const vec4 &);
    bool  isinf(const float &);
    bvec2 isinf(const vec2 &);
    bvec3 isinf(const vec3 &);
    bvec4 isinf(const vec4 &);
    int   floatBitsToInt(const float &);
    ivec2 floatBitsToInt(const vec2 &);
    ivec3 floatBitsToInt(const vec3 &);
    ivec4 floatBitsToInt(const vec4 &);
    uint  floatBitsToUint(const float &);
    uvec2 floatBitsToUint(const vec2 &);
    uvec3 floatBitsToUint(const vec3 &);
    uvec4 floatBitsToUint(const vec4 &);
    float intBitsToFloat(const int &);
    vec2  intBitsToFloat(const ivec2 &);
    vec3  intBitsToFloat(const ivec3 &);
    vec4  intBitsToFloat(const ivec4 &);
    float uintBitsToFloat(const uint &);
    vec2  uintBitsToFloat(const uvec2 &);
    vec3  uintBitsToFloat(const uvec3 &);
    vec4  uintBitsToFloat(const uvec4 &);
    FLOAT_SCALAR_OR_VECTOR_3_PARAMS(fma)
    //float frexp(const float &, float &);
    //vec2  frexp(const vec2  &, vec2  &);
    //vec3  frexp(const vec3  &, vec3  &);
    //vec4  frexp(const vec4  &, vec4  &);
    //FLOAT_SCALAR_OR_VECTOR_2_PARAMS(ldexp)
%enddef // DECLARE_FUNC_COMMON


// glm/detail/func_exponential.hpp
%define DECLARE_FUNC_EXPONENTIAL()
    FLOAT_SCALAR_OR_VECTOR_2_PARAMS(pow)
    FLOAT_SCALAR_OR_VECTOR(exp)
    FLOAT_SCALAR_OR_VECTOR(log)
    FLOAT_SCALAR_OR_VECTOR(exp2)
    FLOAT_SCALAR_OR_VECTOR(log2)
    FLOAT_VECTOR(sqrt)
    FLOAT_SCALAR_OR_VECTOR(inversesqrt)
%enddef // DECLARE_FUNC_EXPONENTIAL


// glm/detail/func_geometric.hpp
%define DECLARE_FUNC_GEOMETRIC()
    FLOAT_VECTOR_RETURN_VALUE(length)
    FLOAT_VECTOR_RETURN_VALUE_2_PARAMS(distance)
    FLOAT_VECTOR_RETURN_VALUE_2_PARAMS(dot)
    vec3 cross(const vec3 &, const vec3 &);
    FLOAT_VECTOR(normalize)
    FLOAT_VECTOR_3_PARAMS(faceforward)
    FLOAT_VECTOR_2_PARAMS(reflect)
    vec2 refract(const vec2 &, const vec2 &, const float &);
    vec3 refract(const vec3 &, const vec3 &, const float &);
    vec4 refract(const vec4 &, const vec4 &, const float &);
%enddef // DECLARE_FUNC_GEOMETRIC


// glm/detail/func_integer.hpp
%define DECLARE_FUNC_INTEGER()
    uint  uaddCarry(const uint  &, const uint  &, uint  &);
    uvec2 uaddCarry(const uvec2 &, const uvec2 &, uvec2 &);
    uvec3 uaddCarry(const uvec3 &, const uvec3 &, uvec3 &);
    uvec4 uaddCarry(const uvec4 &, const uvec4 &, uvec4 &);
    uint  usubBorrow(const uint  &, const uint  &, uint  &);
    uvec2 usubBorrow(const uvec2 &, const uvec2 &, uvec2 &);
    uvec3 usubBorrow(const uvec3 &, const uvec3 &, uvec3 &);
    uvec4 usubBorrow(const uvec4 &, const uvec4 &, uvec4 &);
    void  umulExtended(const uint  &, const uint  &, uint  &, uint  &);
    void  umulExtended(const uvec2 &, const uvec2 &, uvec2 &, uvec2 &);
    void  umulExtended(const uvec3 &, const uvec3 &, uvec3 &, uvec3 &);
    void  umulExtended(const uvec4 &, const uvec4 &, uvec4 &, uvec4 &);
    void  imulExtended(const int   &, const int   &, int   &, int   &);
    void  imulExtended(const ivec2 &, const ivec2 &, ivec2 &, ivec2 &);
    void  imulExtended(const ivec3 &, const ivec3 &, ivec3 &, ivec3 &);
    void  imulExtended(const ivec4 &, const ivec4 &, ivec4 &, ivec4 &);
    int   bitfieldExtract(const int   &, const int &, const int &);
    ivec2 bitfieldExtract(const ivec2 &, const int &, const int &);
    ivec3 bitfieldExtract(const ivec3 &, const int &, const int &);
    ivec4 bitfieldExtract(const ivec4 &, const int &, const int &);
    uint  bitfieldExtract(const uint  &, const int &, const int &);
    uvec2 bitfieldExtract(const uvec2 &, const int &, const int &);
    uvec3 bitfieldExtract(const uvec3 &, const int &, const int &);
    uvec4 bitfieldExtract(const uvec4 &, const int &, const int &);
    int   bitfieldInsert(const int   &, const int   &, const int &, const int &);
    ivec2 bitfieldInsert(const ivec2 &, const ivec2 &, const int &, const int &);
    ivec3 bitfieldInsert(const ivec3 &, const ivec3 &, const int &, const int &);
    ivec4 bitfieldInsert(const ivec4 &, const ivec4 &, const int &, const int &);
    uint  bitfieldInsert(const uint  &, const uint  &, const int &, const int &);
    uvec2 bitfieldInsert(const uvec2 &, const uvec2 &, const int &, const int &);
    uvec3 bitfieldInsert(const uvec3 &, const uvec3 &, const int &, const int &);
    uvec4 bitfieldInsert(const uvec4 &, const uvec4 &, const int &, const int &);
    int   bitfieldReverse(const int   &);
    ivec2 bitfieldReverse(const ivec2 &);
    ivec3 bitfieldReverse(const ivec3 &);
    ivec4 bitfieldReverse(const ivec4 &);
    uint  bitfieldReverse(const uint  &);
    uvec2 bitfieldReverse(const uvec2 &);
    uvec3 bitfieldReverse(const uvec3 &);
    uvec4 bitfieldReverse(const uvec4 &);
    int   bitCount(const int   &);
    ivec2 bitCount(const ivec2 &);
    ivec3 bitCount(const ivec3 &);
    ivec4 bitCount(const ivec4 &);
    int   bitCount(const uint  &);
    ivec2 bitCount(const uvec2 &);
    ivec3 bitCount(const uvec3 &);
    ivec4 bitCount(const uvec4 &);
    int   findLSB(const int   &);
    ivec2 findLSB(const ivec2 &);
    ivec3 findLSB(const ivec3 &);
    ivec4 findLSB(const ivec4 &);
    int   findLSB(const uint  &);
    ivec2 findLSB(const uvec2 &);
    ivec3 findLSB(const uvec3 &);
    ivec4 findLSB(const uvec4 &);
    int   findMSB(const int   &);
    ivec2 findMSB(const ivec2 &);
    ivec3 findMSB(const ivec3 &);
    ivec4 findMSB(const ivec4 &);
    int   findMSB(const uint  &);
    ivec2 findMSB(const uvec2 &);
    ivec3 findMSB(const uvec3 &);
    ivec4 findMSB(const uvec4 &);
%enddef // DECLARE_FUNC_INTEGER


// glm/detail/func_matrix.hpp
%define DECLARE_FUNC_MATRIX()
    mat2x2 matrixCompMult(const mat2x2 &, const mat2x2 &);
    mat2x3 matrixCompMult(const mat2x3 &, const mat2x3 &);
    mat2x4 matrixCompMult(const mat2x4 &, const mat2x4 &);
    mat3x2 matrixCompMult(const mat3x2 &, const mat3x2 &);
    mat3x3 matrixCompMult(const mat3x3 &, const mat3x3 &);
    mat3x4 matrixCompMult(const mat3x4 &, const mat3x4 &);
    mat4x2 matrixCompMult(const mat4x2 &, const mat4x2 &);
    mat4x3 matrixCompMult(const mat4x3 &, const mat4x3 &);
    mat4x4 matrixCompMult(const mat4x4 &, const mat4x4 &);
    mat2x2 outerProduct(const vec2 &, const vec2 &);
    //mat2x3 outerProduct(const vec2 &, const vec3 &);
    //mat2x4 outerProduct(const vec2 &, const vec4 &);
    //mat3x2 outerProduct(const vec3 &, const vec2 &);
    mat3x3 outerProduct(const vec3 &, const vec3 &);
    //mat3x4 outerProduct(const vec3 &, const vec4 &);
    //mat4x2 outerProduct(const vec4 &, const vec2 &);
    //mat4x3 outerProduct(const vec4 &, const vec3 &);
    mat4x4 outerProduct(const vec4 &, const vec4 &);
    mat2x2 transpose(const mat2x2 &);
    mat2x3 transpose(const mat3x2 &);
    mat2x4 transpose(const mat4x2 &);
    mat3x2 transpose(const mat2x3 &);
    mat3x3 transpose(const mat3x3 &);
    mat3x4 transpose(const mat4x3 &);
    mat4x2 transpose(const mat2x4 &);
    mat4x3 transpose(const mat3x4 &);
    mat4x4 transpose(const mat4x4 &);
    float determinant(const mat2x2 &);
    float determinant(const mat3x3 &);
    float determinant(const mat4x4 &);
    mat2x2 inverse(const mat2x2 &);
    mat3x3 inverse(const mat3x3 &);
    mat4x4 inverse(const mat4x4 &);
%enddef // DECLARE_FUNC_MATRIX


// glm/detail/func_noise.hpp
%define DECLARE_FUNC_NOISE()
    //float noise1(const float &);
    //float noise1(const vec2 &);
    //float noise1(const vec3 &);
    //float noise1(const vec4 &);
    //vec2  noise2(const float &);
    //vec2  noise2(const vec2 &);
    //vec2  noise2(const vec3 &);
    //vec2  noise2(const vec4 &);
    //vec3  noise3(const float &);
    //vec3  noise3(const vec2 &);
    //vec3  noise3(const vec3 &);
    //vec3  noise3(const vec4 &);
    //vec4  noise4(const float &);
    //vec4  noise4(const vec2 &);
    //vec4  noise4(const vec3 &);
    //vec4  noise4(const vec4 &);
%enddef // DECLARE_FUNC_NOISE


// glm/detail/func_packing.hpp
%define DECLARE_FUNC_PACKING()
    uint packUnorm2x16(const vec2 &);
    uint packSnorm2x16(const vec2 &);
    uint packUnorm4x8(const vec4 &);
    uint packSnorm4x8(const vec4 &);
    vec2 unpackUnorm2x16(const uint &);
    vec2 unpackSnorm2x16(const uint &);
    vec4 unpackUnorm4x8(const uint &);
    vec4 unpackSnorm4x8(const uint &);
    double packDouble2x32(const uvec2 &);
    uvec2 unpackDouble2x32(const double &);
    uint packHalf2x16(const vec2 &);
    vec2 unpackHalf2x16(const uint &);
%enddef // DECLARE_FUNC_PACKING


// glm/detail/func_trigonometric.hpp
%define DECLARE_FUNC_TRIGONOMETRIC()
    FLOAT_SCALAR_OR_VECTOR(radians)
    FLOAT_SCALAR_OR_VECTOR(degrees)
    FLOAT_SCALAR_OR_VECTOR(sin)
    FLOAT_SCALAR_OR_VECTOR(cos)
    FLOAT_SCALAR_OR_VECTOR(tan)
    FLOAT_SCALAR_OR_VECTOR(asin)
    FLOAT_SCALAR_OR_VECTOR(acos)
    FLOAT_SCALAR_OR_VECTOR_2_PARAMS(atan)
    FLOAT_SCALAR_OR_VECTOR(atan)
    FLOAT_SCALAR_OR_VECTOR(sinh)
    FLOAT_SCALAR_OR_VECTOR(cosh)
    FLOAT_SCALAR_OR_VECTOR(tanh)
    FLOAT_SCALAR_OR_VECTOR(asinh)
    FLOAT_SCALAR_OR_VECTOR(acosh)
    FLOAT_SCALAR_OR_VECTOR(atanh)
%enddef // DECLARE_FUNC_TRIGONOMETRIC


// glm/detail/func_vector_relational.hpp
%define DECLARE_FUNC_VECTOR_RELATIONAL()
    bvec2 lessThanEqual(const vec2 &, const vec2 &);
    bvec3 lessThanEqual(const vec3 &, const vec3 &);
    bvec4 lessThanEqual(const vec4 &, const vec4 &);
    bvec2 greaterThan(const vec2 &, const vec2 &);
    bvec3 greaterThan(const vec3 &, const vec3 &);
    bvec4 greaterThan(const vec4 &, const vec4 &);
    bvec2 greaterThanEqual(const vec2 &, const vec2 &);
    bvec3 greaterThanEqual(const vec3 &, const vec3 &);
    bvec4 greaterThanEqual(const vec4 &, const vec4 &);
    bvec2 notEqual(const vec2 &, const vec2 &);
    bvec3 notEqual(const vec3 &, const vec3 &);
    bvec4 notEqual(const vec4 &, const vec4 &);
    bool  any(const bvec2 &);
    bool  any(const bvec3 &);
    bool  any(const bvec4 &);
    bool  all(const bvec2 &);
    bool  all(const bvec3 &);
    bool  all(const bvec4 &);
    bvec2 not_(const bvec2 &);
    bvec3 not_(const bvec3 &);
    bvec4 not_(const bvec4 &);
%enddef // DECLARE_FUNC_VECTOR_RELATIONAL


// Declare functions
namespace glm {
    // glm/detail/func_common.hpp
    DECLARE_FUNC_COMMON()
    
    // glm/detail/func_exponential.hpp
    DECLARE_FUNC_EXPONENTIAL()
    
    // glm/detail/func_geometric.hpp
    DECLARE_FUNC_GEOMETRIC()
    
    // glm/detail/func_integer.hpp
    //DECLARE_FUNC_INTEGER()
    
    // glm/detail/func_matrix.hpp
    DECLARE_FUNC_MATRIX()
    
    // glm/detail/func_noise.hpp
    DECLARE_FUNC_NOISE()
    
    // glm/detail/func_packing.hpp
    //DECLARE_FUNC_PACKING()
    
    // glm/detail/func_trigonometric.hpp
    DECLARE_FUNC_TRIGONOMETRIC()
    
    // glm/detail/func_vector_relational.hpp
    DECLARE_FUNC_VECTOR_RELATIONAL()
}

#endif // defined SWIG
