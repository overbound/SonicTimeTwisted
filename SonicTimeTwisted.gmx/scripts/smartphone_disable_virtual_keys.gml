// if there's a parameter equal to true, don't release pressed keys
var dontRelease = false;
if(argument_count >= 1)
{
    if(argument[0])
    {
        dontRelease = true;
    }
}
if(objProgram.os == os_android)
{
    if(ANDROID_CONSOLE == 0)
    {
        if(!dontRelease)
        {
            with(objProgram.inputManager)
            {   
                android_vk_release(cUP);
                android_vk_release(cLEFT);
                android_vk_release(cRIGHT);
                android_vk_release(cDOWN);
                android_vk_release(cA);
                android_vk_release(cB);
                android_vk_release(cC);
                android_vk_release(cSTART);
            }
        }
        with(objProgram.inputManager)
        {   
            event_user(2);
        }
    }
}
