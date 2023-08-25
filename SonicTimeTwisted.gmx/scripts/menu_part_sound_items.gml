items = false;

menu_fn_add_title(tr("_menu_sfx_Title"));
menu_fn_add_option(tr("_menu_sfx_MasterVolume"), 0, 1, "");
menu_fn_add_option(tr("_menu_sfx_SFXVolume"), 1, 1, "");
menu_fn_add_option(tr("_menu_sfx_MusicVolume"), 2, 1, "");
menu_fn_add_option(tr("_menu_Back"), 3);

action_script = menu_part_sound_actions;
draw_script = menu_fn_draw_default;
step_script = menu_part_sound_step;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;

// run this to refresh displayed existing values
// -4 is an action that does not exist
menu_part_sound_actions(-4);
