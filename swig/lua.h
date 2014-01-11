#if defined HACT_ANDROID
    #include "lib/android/lua/include/lua.h"
#elif defined HACT_UNIX
    //#include <lua5.2/lua.h>
    #include <lua.h>
#elif defined HACT_WINDOWS
    #include "lib/lua/src/lua.h"
#endif

