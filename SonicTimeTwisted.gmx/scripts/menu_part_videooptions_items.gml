items = false;

menu_fn_add_title(tr("Video options"));
if(DEVICE_INFO & DEVICE_TYPE_COMPUTER)
{
    menu_fn_add_option(tr("Screen size"), 0, 1, "");
}
menu_fn_add_option(tr("Score tally mode"), 1, 1, "");
menu_fn_add_option(tr("Flashing reduction"), 2, 1, "");
menu_fn_add_option(tr("< Back"), 3);

button_width = 350;

action_script = menu_part_videooptions_actions;
draw_script = menu_fn_draw_default;
step_script = menu_fn_step_default;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;

// run this to refresh displayed existing values
// -4 is an action that does not exist
menu_part_videooptions_actions(-4);
