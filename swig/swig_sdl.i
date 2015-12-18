#if defined SWIG

// Module name
%module SDL

%{
    // Ignore warnings in generated code (some minor bug in SWIG)
    #if defined __clang__
    #pragma clang diagnostic ignored "-Wmaybe-uninitialized"
    #pragma clang diagnostic ignored "-Werror-uninitialized"
    #elif defined __GNUC__
    #pragma GCC diagnostic ignored "-Wmaybe-uninitialized"
    #pragma GCC diagnostic ignored "-Werror-uninitialized"
    #endif // defined __clang__
    
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
