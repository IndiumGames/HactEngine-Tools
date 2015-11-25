#if defined SWIG

// Module name
%module SDL

%{
    #include "thirdparty/SDL2/SDL_stdinc.h"
    #include "thirdparty/SDL2/SDL_keyboard.h"
    #include "thirdparty/SDL2/SDL_keycode.h"
    #include "thirdparty/SDL2/SDL_scancode.h"
    #include "thirdparty/SDL2/SDL_events.h"
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

#endif // defined SWIG
