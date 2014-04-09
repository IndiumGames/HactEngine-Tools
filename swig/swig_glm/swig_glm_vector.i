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
