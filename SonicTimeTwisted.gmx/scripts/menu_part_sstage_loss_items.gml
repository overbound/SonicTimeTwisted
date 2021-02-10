if(objProgram.saveSlot == -2)
{
    // level select
    menu_fn_add_option(tr("_specialstage_menu_Try_Again"), 0);
    menu_fn_add_option(tr("_specialstage_menu_Quit"), 1);
}
else
{
    if(objGameData.player_lives[0] > 1)
    {
        menu_fn_add_option(tr("_specialstage_menu_Try_Again_life"), 0);
    }
    menu_fn_add_option(tr("_specialstage_menu_Return_to_act"), 1);
}
menu_fn_calculate_width_simple();
// this means "special stage defeat menu"
menu_type = 2;

action_script = menu_part_sstage_loss_actions;
draw_script = menu_part_sstage_loss_draw;
step_script = menu_part_sstage_loss_step;
keys_script = menu_fn_keys_default;
touchscreen_script = menu_fn_touchscreen_default;
