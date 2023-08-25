items = false;
menu_fn_add_title(tr("_menu_touch_Title"));
menu_fn_add_option(tr("_menu_touch_Reposition"), 0);
menu_fn_add_option(tr("_menu_touch_Size"), 1, 1, "");
menu_fn_add_option(tr("_menu_touch_DPadMode"), 2, 1, "");
menu_fn_add_option(tr("_menu_touch_Opacity"), 3, 1, "");
menu_fn_add_option(tr("_menu_touch_Deadzone"), 9, 1, "");
menu_fn_add_option(tr("_menu_touch_Detection"), 10, 1, "");
menu_fn_add_option(tr("_menu_touch_Analog"), 7);
if (sttandroid_device_has_gyroscope()) {
    menu_fn_add_option(tr("_menu_touch_SSControls"), 4);
}
menu_fn_add_option(tr("_menu_touch_GGControls"), 5, 1, "");
menu_fn_add_option(tr("_menu_Back"), 6);

action_script = menu_part_touchscreen_actions;
draw_script = menu_part_touchscreen_draw;
step_script = menu_part_touchscreen_step;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;

// run this to refresh displayed existing values
// -4 is an action that does not exist
menu_part_touchscreen_actions(-4);
