items = false;

menu_fn_add_title(tr("_menu_i18n_Title"));
menu_fn_add_option(tr("_menu_i18n_Language"), 0, 1, tr_get_lang_friendlyname());
menu_fn_add_option(tr("_menu_i18n_Reload"), 1);
//menu_fn_add_option(tr("_menu_i18n_Export"), 2);
menu_fn_add_option(tr("_menu_Back"), 3);

action_script = menu_part_l18n_actions;
draw_script = menu_fn_draw_default;
step_script = menu_fn_step_default;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;

// run this to refresh displayed existing values
// -4 is an action that does not exist
menu_part_l18n_actions(-4);
