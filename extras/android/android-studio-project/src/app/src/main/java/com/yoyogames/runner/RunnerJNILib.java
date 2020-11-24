package com.yoyogames.runner;

import android.content.Context;

/**
 * Replacement class for RunnerJNILib, used to make sure the code can be used with
 * GameMaker Studio as-is.
 */
public class RunnerJNILib {

    public static Context ms_context;

    public static void Init(Context _context) {
        ms_context = _context;
    }

    public static Context GetApplicationContext() {
        return ms_context;
    }
}
