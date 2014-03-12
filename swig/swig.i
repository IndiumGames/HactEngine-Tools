#if defined SWIG

// Module name
%module Hact

%{
// Includes
#include "../../audio.h"
#include "../../audiomanager.h"
#include "../../chronotime.h"
#include "../../collisionarea.h"
#include "../../collisionshape.h"
#include "../../collisionvector.h"
#include "../../debug.h"
#include "../../editorwindow.h"
#include "../../entity.h"
#include "../../gameengine.h"
#include "../../hierarchyobject.h"
#include "../../input.h"
#include "../../logger.h"
#include "../../loglistener.h"
#include "../../logmessage.h"
#include "../../logqueue.h"
#include "../../mesh.h"
#include "../../property.h"
#include "../../propertyboolean.h"
#include "../../propertyfloat.h"
#include "../../propertyinteger.h"
#include "../../propertymatrix.h"
#include "../../propertystring.h"
#include "../../propertyvector.h"
#include "../../qtquickmanager.h"
#include "../../qtquickwrapper.h"
#include "../../resourcemanager.h"
#include "../../resourceutil.h"
#include "../../scriptingengine.h"
#include "../../shaderprogram.h"
#include "../../text.h"
#include "../../texture.h"
#include "../../util.h"
#include "../../xmlelement.h"
#include "../../xmlutils.h"
%}


// Cross platform integer types
%include <stdint.i>

// String support
%include <std_string.i>

// Exception support
%include <std_except.i>
%include <exception.i>
%exception {
    try {
        $action
    }
    catch (const std::exception& e) {
        SWIG_exception(SWIG_RuntimeError, e.what());
    }
}

// Vector support
%include <std_vector.i>

// Instantiate different types of vectors
namespace std {
    %template(Int32Vector)   vector<int32_t>;
    %template(UInt32Vector)  vector<uint32_t>;
    %template(Int64Vector)   vector<int64_t>;
    %template(UInt64Vector)  vector<uint64_t>;
    %template(FloatVector)   vector<float>;
    %template(DoubleVector)  vector<double>;
    %template(StringVector)  vector<string>;
    
    %template(EntityPointerVector) vector<Entity*>;
    
    %template(PropertyPointerVector) vector<Property*>;
    %template(ShaderProgramPointerVector) vector<ShaderProgram*>;
};


// HierarchyObject
%include "../../hierarchyobject.h"
//%template(EditorWindowHierarchyObject) HierarchyObject<EditorWindow>;
%template(EntityHierarchyObject)       HierarchyObject<Entity>;


// Audio and AudioManager
%include "../../audio.h"
%include "../../audiomanager.h"

// ChronoTime
%include "../../chronotime.h"

// CollisionArea and the classes it needs
%include "../../collisionvector.h"
%include "../../collisionshape.h"
%include "../../collisionarea.h"

// Debug
%include "../../debug.h"

// EditorWindow and EditorWindowManager
%include "../../editorwindow.h"

// Entity
%include "../../entity.h"

// GameEngine
%include "../../gameengine.h"

// Input
%include "../../input.h"

// Logging
%include "../../logger.h"
%include "../../loglistener.h"
%include "../../logmessage.h"
%include "../../logqueue.h"

// Mesh
%include "../../mesh.h"

// Property and derived classes
%include "../../property.h"
%include "../../propertyboolean.h"
%include "../../propertyfloat.h"
%include "../../propertyinteger.h"
%include "../../propertymatrix.h"
%include "../../propertystring.h"
%include "../../propertyvector.h"

// QtQuickManager and QtQuickWrapper
%include "../../qtquickmanager.h"
%include "../../qtquickwrapper.h"

// ResourceManager and ResourceUtil
%include "../../resourcemanager.h"
%include "../../resourceutil.h"

// ScriptingEngine
%include "../../scriptingengine.h"

// ShaderProgram
%include "../../shaderprogram.h"

// Text
//%include "../../text.h"

// Texture
%include "../../texture.h"

// Util
%include "../../util.h"

// XmlElement and XmlUtils
%include "../../xmlelement.h"
%include "../../xmlutils.h"

#endif // defined SWIG
