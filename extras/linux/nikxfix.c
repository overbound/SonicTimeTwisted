/*
libnikXfix by nkrapivindev, Sonic Time Twisted edition.
Install gcc-multilib
Compile me as:
gcc -m32 -fPIC -ldl -shared nikxfix.c -o libnikxfix.so
Then update the lib in included files [root]/SonicTimeTwisted.gmx/datafiles/
Enjoy!
*/
#ifndef _GNU_SOURCE
#define _GNU_SOURCE 1
#endif
#include <stdlib.h>
#include <stdio.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <dlfcn.h>

typedef int (*XLookupString_type)(XKeyEvent*, char*, int, KeySym*, XComposeStatus*);
static XLookupString_type XLookupString_orig = NULL;

#define NPRINT(...) do { printf("[nikXfix]: "); printf(__VA_ARGS__); printf("\n"); fflush(stdout); } while (0)

int XLookupString(
    XKeyEvent* event_struct,
    char* buffer_return,
    int bytes_buffer,
    KeySym* keysym_return,
    XComposeStatus* status_in_out
) {
	int rc; /* return code */
	
	if (!XLookupString_orig) {
		NPRINT("Trying to resolve XLookupString...");
		XLookupString_orig = dlsym(RTLD_NEXT, "XLookupString");
		if (!XLookupString_orig) {
			NPRINT("Unable to resolve XLookupString!");
			abort();
		}
		NPRINT("XLookupString is resolved to 0x%p", XLookupString_orig);
	}
	
	/* restricts the bitmask to 8bit range only, excluding all locale info, change if this breaks things! */
	if (event_struct) event_struct->state &= 0xFFu;
	rc = XLookupString_orig(event_struct, buffer_return, bytes_buffer, keysym_return, status_in_out);
	
	/* big fun */
#ifdef DEBUG
	NPRINT("rc=%d,keycode=0x%X,state=0x%X", rc, event_struct->keycode, event_struct->state);
#endif
	
	return rc;
}


