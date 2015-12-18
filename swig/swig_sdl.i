#if defined SWIG

// Module name
%module SDL

%{
    #if defined __GNUC__ && !defined __clang__
    // Ignore warnings in generated code (some minor bug in SWIG)
    #pragma GCC diagnostic ignored "-Wmaybe-uninitialized"
    #endif // defined __GNUC__ && !defined __clang__
    
    #include "thirdparty/SDL2/SDL_stdinc.h"
    #include "thirdparty/SDL2/SDL_keyboard.h"
    #include "thirdparty/SDL2/SDL_keycode.h"
    #include "thirdparty/SDL2/SDL_scancode.h"
    #include "thirdparty/SDL2/SDL_events.h"
    #include "thirdparty/SDL2/SDL_joystick.h"
    #include "thirdparty/SDL2/SDL_gamecontroller.h"
%}

// Cross platform integer types
%include <stdint.i>

// Rename SDL `repeat` calls to `keyrepeat`
%rename(keyrepeat) repeat;

%include "thirdparty/SDL2/SDL_stdinc.h"
%include "thirdparty/SDL2/SDL_keyboard.h"
%include "thirdparty/SDL2/SDL_keycode.h"
%include "thirdparty/SDL2/SDL_scancode.h"
%include "thirdparty/SDL2/SDL_events.h"
%include "thirdparty/SDL2/SDL_joystick.h"
%include "thirdparty/SDL2/SDL_gamecontroller.h"

#endif // defined SWIG
