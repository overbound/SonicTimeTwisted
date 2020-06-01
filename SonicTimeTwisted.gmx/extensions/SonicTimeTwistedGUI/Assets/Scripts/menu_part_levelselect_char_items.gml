items = false;
menu_fn_add_title(tr("Character select"));
// these options only serve to set the window's height
// the handling of options here is mostly custom
menu_fn_add_title("");
menu_fn_add_title("");
menu_fn_add_title("");
menu_fn_add_option("< "+tr("Main menu"), 0);


// this means "level select"
menu_type = 3;

button_width = 200;

action_script = menu_part_levelselect_char_actions;
draw_script = menu_part_levelselect_char_draw;
step_script = menu_part_levelselect_char_step;
keys_script = menu_part_levelselect_char_keys;
touchscreen_script = menu_part_levelselect_char_touchscreen;

if(cursor != -1)
{
    temporary_variable = objGameData.character_id[0] - 1;
    cursor = objGameData.character_id[0] - 1;
}
else
{
    temporary_variable = 0;
}
