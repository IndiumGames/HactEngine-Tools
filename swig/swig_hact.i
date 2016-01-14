#if defined SWIG

// Module name
%module Hact

%{
    // Includes
    #include "src/audio.h"
    #include "src/audiomanager.h"
    #include "src/chronotime.h"
    #include "src/container.h"
    #include "src/editor.h"
    #include "src/editorinput.h"
    #include "src/editorwindow.h"
    #include "src/element.h"
    #include "src/entity.h"
    #include "src/event.h"
    #include "src/gamecontroller.h"
    #include "src/gameengine.h"
    #include "src/gameengineconfig.h"
    #include "src/gamewindow.h"
    #include "src/hierarchy.h"
    #include "src/input.h"
    #include "src/log.h"
    #include "src/mesh.h"
    #include "src/openglcontext.h"
    #include "src/property.h"
    #include "src/resourcemanager.h"
    #include "src/scriptingengine.h"
    #include "src/shaderobject.h"
    #include "src/shaderprogram.h"
    #include "src/text.h"
    #include "src/texture.h"
    #include "src/thread.h"
    #include "src/util.h"
    #include "src/util_opengl.h"
    #include "src/util_x3d.h"
    #include "src/util_xml.h"
    #include "src/xmlelement.h"
%}


// Cross platform integer types
%include <stdint.i>

// std::string support
%include <std_string.i>

// Exception support
%include <exception.i>
%include <std_except.i>
%exception {
    try {
        $action
    }
    catch (const std::runtime_error& exception) {
        SWIG_exception(SWIG_RuntimeError, exception.what());
    }
    catch (const std::exception& exception) {
        SWIG_exception(SWIG_SystemError, exception.what());
    }
}

// std::vector support
//%include <std_vector.i>
%include "std_vector_improved.i"
namespace std {
    %template(Int32Vector)   vector<int32_t>;
    %template(UInt32Vector)  vector<uint32_t>;
    %template(Int64Vector)   vector<int64_t>;
    %template(UInt64Vector)  vector<uint64_t>;
    %template(FloatVector)   vector<float>;
    %template(DoubleVector)  vector<double>;
    %template(StringVector)  vector<string>;
};


// Element
%include "src/element.h"

// Hierarchy
%include "src/hierarchy.h"
%template(EditorHierarchy)      Hierarchy<Editor, OrderedContainer<Editor>>;
%template(EntityHierarchy)      Hierarchy<Entity, Container<Entity>>;
%template(XmlElementHierarchy)  Hierarchy<XmlElement, OrderedContainer<XmlElement>>;


// Audio and AudioManager
%include "src/audio.h"
%include "src/audiomanager.h"

// ChronoTime
%include "src/chronotime.h"

// Container
%include "src/container.h"

%template(EntityContainer)         Container<Entity>;
%template(PropertyContainer)       Container<Property>;
%template(GameControllerContainer) OrderedContainer<GameController>;
%template(GameWindowContainer)     OrderedContainer<GameWindow>;
%template(EditorContainer)         OrderedContainer<Editor>;
%template(EditorWindowContainer)   OrderedContainer<EditorWindow>;
%template(EventContainer)          OrderedContainer<Event>;
%template(ShaderObjectContainer)   OrderedContainer<ShaderObject>;
%template(ThreadContainer)         OrderedContainer<Thread>;
%template(XmlAttributeContainer)   OrderedContainer<XmlAttribute>;
%template(XmlElementContainer)     OrderedContainer<XmlElement>;

%extend OrderedContainer<GameWindow> {
    GameWindow* Emplace(const std::string &id) {
        return $self->Emplace(id);
    }
};

%extend OrderedContainer<Thread> {
    Thread* Emplace(const std::string &initialScript,
                    const float &yieldTime = 0.01f,
                    const bool &yield = true) {
        return $self->Emplace(initialScript, yieldTime, yield);
    }
};


// Editor, EditorInput and EditorWindow
%include "src/editor.h"
%include "src/editorinput.h"
%include "src/editorwindow.h"

// Entity
%include "src/entity.h"

// Event
%include "src/event.h"

// GameController
%include "src/gamecontroller.h"

// GameEngine
%include "src/gameengine.h"

// GameEngineConfig
%include "src/gameengineconfig.h"

// GameWindow
%include "src/gamewindow.h"

// Input
%include "src/input.h"

// Logging
%include "src/log.h"

// Mesh
%include "src/mesh.h"

// OpenGlContext
%include "src/openglcontext.h"

// Property
%include "src/property.h"

// ResourceManager
%include "src/resourcemanager.h"

// ScriptingEngine
%include "src/scriptingengine.h"

// ShaderObject and ShaderProgram
%include "src/shaderobject.h"
%include "src/shaderprogram.h"

// Text
//%include "src/text.h"

// Texture
%include "src/texture.h"

// Thread
%include "src/thread.h"

// Util
%include "src/util.h"
%include "src/util_opengl.h"
%include "src/util_x3d.h"
%include "src/util_xml.h"

// XmlElement
%include "src/xmlelement.h"

#endif // defined SWIG
