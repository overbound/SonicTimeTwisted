var hint = instance_create(0, 0, objInputHelp);
hint.hint = tr("_hint_ggpoint");
hint.in3d = false;

input_manage_script = input_method_ggpoint;
input_draw_script = input_method_draw_ggpoint;

input_rumble_manage_script = input_method_dummy_script;
input_rumble_perform_script = rumble_perform_null;
input_rumble_trigger_script = input_method_dummy_script;
if((DEVICE_INFO & DEVICE_TYPE_SMARTPHONE) && (vibration_type > 0))
{
    switch(vibration_type)
    {
        case 1:
            input_rumble_manage_script = input_method_haptics_ggpoint;
            input_rumble_trigger_script = input_method_dummy_script;
            break;
        case 2:
            input_rumble_manage_script = input_method_dummy_script;
            input_rumble_trigger_script = rumble_manage;
            break;
        case 3:
            input_rumble_manage_script = input_method_haptics_ggpoint;
            input_rumble_trigger_script = rumble_manage;
            break;
    }
    if(DEVICE_INFO & DEVICE_OS_ANDROID)
    {
        input_rumble_perform_script = rumble_perform_android_smartphone;
    }
}
// don't display in menus
if(objScreen.paused)
{
    image_alpha = 0;
}
joyalpha = image_alpha;
