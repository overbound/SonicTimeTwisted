if(objProgram.saveSlot == -1)
{
    // level select
    menu_fn_add_option(tr("Try again"), 0);
    menu_fn_add_option(tr("Quit"), 2);
    button_width = 200;
}
else
{
    if(objGameData.player_lives[0] > 1)
    {
        menu_fn_add_option(tr("Try again (-1 life)"), 0);
    }
    menu_fn_add_option(tr("Return to act"), 1);
    button_width = 240;
}
// this means "special stage defeat menu"
menu_type = 2;

action_script = menu_part_sstage_loss_actions;
draw_script = menu_part_sstage_loss_draw;
step_script = menu_part_sstage_loss_step;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;
