items = false;

var title = tr("Act select");
switch(temporary_variable)
{
    case 0:
        title = tr("_levelselect_menu_AAZ");
        break;
    case 1:
        title = tr("_levelselect_menu_RRZ");
        break;
    case 2:
        title = tr("_levelselect_menu_FFZ");
        break;
    case 3:
        title = tr("_levelselect_menu_VVZ");
        break;
    case 4:
        title = tr("_levelselect_menu_DDZ");
        break;
    case 5:
        title = tr("_levelselect_menu_TTZ");
        break;
}
menu_fn_add_title(title);
menu_fn_add_option(tr("_levelselect_menu_A1F"), 0);
menu_fn_add_option(tr("_levelselect_menu_A1P"), 1);
menu_fn_add_option(tr("_levelselect_menu_A2F"), 2);
menu_fn_add_option(tr("_levelselect_menu_A2P"), 3);
menu_fn_add_option("< "+tr("_levelselect_menu_Back"), 4);

// this means "level select"
menu_type = 3;

menu_fn_calculate_width_simple();

action_script = menu_part_levelselect_4acts_actions;
draw_script = menu_fn_draw_default;
step_script = menu_fn_step_default;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;
