%include "swig_glm/detail/type_mat2x2.hpp"
%include "swig_glm/detail/type_mat2x3.hpp"
%include "swig_glm/detail/type_mat2x4.hpp"
%include "swig_glm/detail/type_mat3x2.hpp"
%include "swig_glm/detail/type_mat3x3.hpp"
%include "swig_glm/detail/type_mat3x4.hpp"
%include "swig_glm/detail/type_mat4x2.hpp"
%include "swig_glm/detail/type_mat4x3.hpp"
%include "swig_glm/detail/type_mat4x4.hpp"

%define EXTEND_MATRIX_INDEX_OPERATOR(classname)
%extend classname {
    // [] is replaced by __getitem__ & __setitem__
    // simply throws a string, which causes a lua error
    col_type __getitem__(unsigned int idx) {
        return (*self)[idx];
    }
    void __setitem__(unsigned int idx, col_type val) {
        (*self)[idx] = val;
    }
};
%enddef

EXTEND_MATRIX_INDEX_OPERATOR(glm::detail::tmat2x2)
EXTEND_MATRIX_INDEX_OPERATOR(glm::detail::tmat2x3)
EXTEND_MATRIX_INDEX_OPERATOR(glm::detail::tmat2x4)
EXTEND_MATRIX_INDEX_OPERATOR(glm::detail::tmat3x2)
EXTEND_MATRIX_INDEX_OPERATOR(glm::detail::tmat3x3)
EXTEND_MATRIX_INDEX_OPERATOR(glm::detail::tmat3x4)
EXTEND_MATRIX_INDEX_OPERATOR(glm::detail::tmat4x2)
EXTEND_MATRIX_INDEX_OPERATOR(glm::detail::tmat4x3)
EXTEND_MATRIX_INDEX_OPERATOR(glm::detail::tmat4x4)
