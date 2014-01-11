#if defined HACT_ANDROID
    #include "lib/android/lua/include/lauxlib.h"
#elif defined HACT_UNIX
    //#include <lua5.2/lauxlib.h>
    #include <lauxlib.h>
#elif defined HACT_WINDOWS
    #include "lib/lua/src/lauxlib.h"
#endif

