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
    if(!dontRelease)
    {
        with(objAndroidInput)
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
    with(objAndroidInput)
    {   
        event_user(2);
    }
}
