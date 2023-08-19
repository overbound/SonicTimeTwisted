items = false;
menu_fn_add_title(tr("_options_menu_touchscreen_title"));
menu_fn_add_option(tr("_options_menu_touchscreen_Reposition_buttons"), 0);
menu_fn_add_option(tr("_options_menu_touchscreen_Button_size"), 1, 1, "");
menu_fn_add_option(tr("_options_menu_touchscreen_DPad_mode"), 2, 1, "");
menu_fn_add_option(tr("_options_menu_touchscreen_Opacity"), 3, 1, "");
menu_fn_add_option(tr("_options_menu_touchscreen_Dead_zone"), 9, 1, "");
menu_fn_add_option(tr("_options_menu_touchscreen_Detection"), 10, 1, "");
if (sttandroid_device_has_gyroscope()) {
    menu_fn_add_option(tr("_options_menu_touchscreen_Special_stage_controls"), 4);
}
menu_fn_add_option(tr("_options_menu_touchscreen_Final_zone_controls"), 5, 1, "");
menu_fn_add_option(tr("_options_menu_Back"), 6);

action_script = menu_part_touchscreen_actions;
draw_script = menu_part_touchscreen_draw;
step_script = menu_part_touchscreen_step;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;

// run this to refresh displayed existing values
// -4 is an action that does not exist
menu_part_touchscreen_actions(-4);
