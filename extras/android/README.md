# Sonic Time Twisted Android work assets #

The Android port of Sonic Time Twisted uses a native library that manages controller inputs and vibrations.

## Tools for working on the library

This directory contains everything that can be used (and has been used) to work on this library.
 - **android-studio-project**: the Android Studio project that is the preferred way to work on the library.
 - **doc**: design document.
 - **gms1-class-sync**: a plain Java project, a small tool used for copying classes from the Android Studio project to the Game Maker Studio project.
 - **gms1-test-project**: a small Game Maker Studio 1 test project that allows testing the library without recompiling Sonic Time Twisted.

**Note**: an Android Studio project, as well as a test Game Maker Studio project, in addition to the game itself, mean that the library is committed three times. Unless you are willing to develop a tool that will synchronize the three copies, please make suure they are synchronized manually.

First, read the documentation in the **doc** subdirectory.

Then, prepare your working environment by copying the **android-studio-project** elsewhere and opening its subdirectory src/ with Android Studio.

Once you are done with improving the library, use **gms1-class-sync** to sync it with **gms1-test-project** and test it out with a real Game Maker Studio 1 test project.

Ultimately, use **gms1-class-sync** to sync the library with the game itself once everything is tested and confirmed to be working.

## Hardware mappings generator

The subdirectory **android-studio-hwmapping-generator** contains the source code for an app that can be used to create hardware mappings for input devices.