#if defined SWIG

// Module name
%module Hact

%{
// Includes
#include "../../src/audio.h"
#include "../../src/audiomanager.h"
#include "../../src/chronotime.h"
#include "../../src/container.h"
#include "../../src/debug.h"
#include "../../src/editorwindow.h"
#include "../../src/entity.h"
#include "../../src/gameengine.h"
#include "../../src/hierarchy.h"
#include "../../src/hierarchyobject.h"
#include "../../src/input.h"
#include "../../src/logger.h"
#include "../../src/loglistener.h"
#include "../../src/logmessage.h"
#include "../../src/logqueue.h"
#include "../../src/mesh.h"
#include "../../src/property.h"
#include "../../src/qtquickmanager.h"
#include "../../src/qtquickwrapper.h"
#include "../../src/resourcemanager.h"
#include "../../src/resourceutil.h"
#include "../../src/scriptingengine.h"
#include "../../src/shaderprogram.h"
#include "../../src/text.h"
#include "../../src/thread.h"
#include "../../src/texture.h"
#include "../../src/util.h"
#include "../../src/xmlelement.h"
#include "../../src/xmlutils.h"
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
    
    %template(ShaderProgramPointerVector) vector<ShaderProgram*>;
    
    %template(XmlAttributePointerVector) vector<XmlAttribute*>;
};


// Hierarchy
%include "../../src/hierarchy.h"
%template(EntityHierarchy)      Hierarchy<Entity, Container<Entity>>;
%template(XmlElementHierarchy)  Hierarchy<NewXmlElement, OrderedContainer<NewXmlElement>>;

// HierarchyObject
%include "../../src/hierarchyobject.h"
%template(XmlElementHierarchyObject)    HierarchyObject<XmlElement>;


// Audio and AudioManager
%include "../../src/audio.h"
%include "../../src/audiomanager.h"

// ChronoTime
%include "../../src/chronotime.h"

// Container
%include "../../src/container.h"
%template(EntityContainer)        Container<Entity>;
%template(PropertyContainer)      Container<Property>;
%template(XmlAttributeContainer)  OrderedContainer<XmlAttribute>;
%template(XmlElementContainer)    OrderedContainer<NewXmlElement>;

// Debug
%include "../../src/debug.h"

// EditorWindow
%include "../../src/editorwindow.h"

// Entity
%include "../../src/entity.h"

// GameEngine
%include "../../src/gameengine.h"

// Input
%include "../../src/input.h"

// Logging
%include "../../src/logger.h"
%include "../../src/loglistener.h"
%include "../../src/logmessage.h"
%include "../../src/logqueue.h"

// Mesh
%include "../../src/mesh.h"

// Property
%include "../../src/property.h"

// QtQuickManager and QtQuickWrapper
%include "../../src/qtquickmanager.h"
%include "../../src/qtquickwrapper.h"

// ResourceManager
%include "../../src/resourcemanager.h"

// ScriptingEngine
%include "../../src/scriptingengine.h"

// ShaderProgram
%include "../../src/shaderprogram.h"

// Thread
%include "../../src/thread.h"

// Text
//%include "../../src/text.h"

// Texture
%include "../../src/texture.h"

// Util
%include "../../src/util.h"
%template(ConvertFloat) Util::Convert::Convert<float>;

// XmlElement and XmlUtils
%include "../../src/xmlelement.h"
%include "../../src/xmlutils.h"

#endif // defined SWIG
