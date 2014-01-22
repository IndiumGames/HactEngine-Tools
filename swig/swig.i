#if defined SWIG
// Module name
%module Hact


// Includes
%{
    #include "../../act.h"
    #include "../../actmanager.h"
    #include "../../audio.h"
    #include "../../audiomanager.h"
    #include "../../chronotime.h"
    #include "../../collisionarea.h"
    #include "../../collisionshape.h"
    #include "../../collisionvector.h"
    #include "../../cursor.h"
    #include "../../debug.h"
    #include "../../dialog.h"
    #include "../../dialogline.h"
    #include "../../editorwindow.h"
    #include "../../entity.h"
    #include "../../gameengine.h"
    #include "../../gamestate.h"
    #include "../../gamestatemanager.h"
    #include "../../hierarchyobject.h"
    #include "../../input.h"
    #include "../../interface.h"
    #include "../../interfaceelement.h"
    #include "../../interfacebutton.h"
    #include "../../property.h"
    #include "../../propertyboolean.h"
    #include "../../propertyfloat.h"
    #include "../../propertyinteger.h"
    #include "../../propertymatrix.h"
    #include "../../propertystring.h"
    #include "../../propertyvector.h"
    #include "../../qtquickmanager.h"
    #include "../../qtquickwrapper.h"
    #include "../../scriptingengine.h"
    #include "../../scriptingwrapper.h"
    #include "../../shadervariable.h"
    #include "../../shape.h"
    #include "../../sprite.h"
    #include "../../spritesheet.h"
    #include "../../text.h"
    #include "../../texture.h"
    #include "../../trigger.h"
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
    %template(IntVector)     vector<int>;
    %template(FloatVector)   vector<float>;
    %template(DoubleVector)  vector<double>;
    %template(StringVector)  vector<string>;
    
    %template(InterfaceElementPointerVector) vector<InterfaceElement*>;
    %template(InterfaceButtonPointerVector)  vector<InterfaceButton*>;
    %template(EntityPointerVector)           vector<Entity*>;
    //%template(HierarchyObjectPointerVector)  vector<HierarchyObject*>;
};


// HierarchyObject
%include "../../hierarchyobject.h"
//%template(EditorWindowHierarchyObject) HierarchyObject<EditorWindow>;
%template(EntityHierarchyObject)       HierarchyObject<Entity>;
%template(TransformHierarchyObject)    HierarchyObject<Transform>;


// Act and ActManager
%include "../../act.h"
%include "../../actmanager.h"

// Audio and AudioManager
%include "../../audio.h"
%include "../../audiomanager.h"

// ChronoTime
%include "../../chronotime.h"

// CollisionArea and the classes it needs
%include "../../collisionvector.h"
%include "../../collisionshape.h"
%include "../../collisionarea.h"

// Cursor
%include "../../cursor.h"

// Debug
%include "../../debug.h"

// Dialog and DialogLine
%include "../../dialog.h"
//%include "../../dialogline.h"

// EditorWindow and EditorWindowManager
%include "../../editorwindow.h"

// Entity
%include "../../entity.h"

// GameEngine
%include "../../gameengine.h"

// GameState and GameStateManager
%include "../../gamestate.h"
%include "../../gamestatemanager.h"

// Input
%include "../../input.h"

// Interface and the classes it needs
%include "../../interface.h"
%include "../../interfaceelement.h"
%include "../../interfacebutton.h"

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

// ScriptingEngine
%include "../../scriptingengine.h"

// ScriptingWrapper
%include "../../scriptingwrapper.h"

// ShaderVariable
%include "../../shadervariable.h"

// Shape
%include "../../shape.h"

// Sprite and SpriteSheet
%include "../../sprite.h"
%include "../../spritesheet.h"

// Text
//%include "../../text.h"

// Texture
%include "../../texture.h"

// Trigger
%include "../../trigger.h"

// Util
%include "../../util.h"

// XmlElement and XmlUtils
%include "../../xmlelement.h"
%include "../../xmlutils.h"

#endif // defined SWIG
