# libnikXfix

This is a small library that fixes YoYo Games's bug where any non-latin keyboard layout wouldn't work.

Compilation steps and all are explained in the `nikxfix.c` file.

All you need is Ubuntu 14.04 and gcc-multilib.

The only dependency is GNU's libC.

To-be-loaded via `LD_LIBRARY_PATH` and then `LD_PRELOAD`.

Have fun.
