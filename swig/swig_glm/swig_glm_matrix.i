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
