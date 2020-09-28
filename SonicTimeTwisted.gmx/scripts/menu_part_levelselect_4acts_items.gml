items = false;

var title = tr("Act select");
switch(temporary_variable)
{
    case 0:
        title = tr("Attraction Attack Zone");
        break;
    case 1:
        title = tr("Raging Ruins Zone");
        break;
    case 2:
        title = tr("Frigid Fortress Zone");
        break;
    case 3:
        title = tr("Viridian Valley Zone");
        break;
    case 4:
        title = tr("Drifting Dynamo Zone");
        break;
    case 5:
        title = tr("Tidal Tubes Zone");
        break;
}
menu_fn_add_title(title);
menu_fn_add_option(tr("Act 1 - Future"), 0);
menu_fn_add_option(tr("Act 1 - Past"), 1);
menu_fn_add_option(tr("Act 2 - Future"), 2);
menu_fn_add_option(tr("Act 2 - Past"), 3);
menu_fn_add_option("< "+tr("Back"), 4);

// this means "level select"
menu_type = 3;

button_width = 200;

action_script = menu_part_levelselect_4acts_actions;
draw_script = menu_fn_draw_default;
step_script = menu_fn_step_default;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;
