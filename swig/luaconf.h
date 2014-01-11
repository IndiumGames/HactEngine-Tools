#if defined HACT_ANDROID
    #include "lib/android/lua/include/luaconf.h"
#elif defined HACT_UNIX
    #include <lua5.2/luaconf.h>
#elif defined HACT_WINDOWS
    #include "lib/lua/src/luaconf.h"
#endif

