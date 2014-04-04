// OpenGL Mathematics

#if defined SWIG

// Module name
%module GLM

%{
#define GLM_SWIZZLE
#include <glm/glm.hpp>
%}


// Types, macros, defines, etc.
%include <glm/detail/setup.hpp>
%include <glm/detail/precision.hpp>
%include <glm/detail/_swizzle_func.hpp>


// Vector types
%import "swig_glm/swig_glm_vector.i"
%template(vec2) glm::detail::tvec2<float, glm::highp>;
%template(vec3) glm::detail::tvec3<float, glm::highp>;
%template(vec4) glm::detail::tvec4<float, glm::highp>;


// Matrix types
%import "swig_glm/swig_glm_matrix.i"
%template(mat2x2) glm::detail::tmat2x2<float, glm::highp>;
%template(mat2x3) glm::detail::tmat2x3<float, glm::highp>;
%template(mat2x4) glm::detail::tmat2x4<float, glm::highp>;
%template(mat3x2) glm::detail::tmat3x2<float, glm::highp>;
%template(mat3x3) glm::detail::tmat3x3<float, glm::highp>;
%template(mat3x4) glm::detail::tmat3x4<float, glm::highp>;
%template(mat4x2) glm::detail::tmat4x2<float, glm::highp>;
%template(mat4x3) glm::detail::tmat4x3<float, glm::highp>;
%template(mat4x4) glm::detail::tmat4x4<float, glm::highp>;

#endif // defined SWIG
