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
