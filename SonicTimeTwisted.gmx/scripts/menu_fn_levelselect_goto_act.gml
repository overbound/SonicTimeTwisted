/// menu_fn_levelselect_goto_act(inPast, currentLevel)
objProgram.saveSlot = -1;
ds_map_clear(objProgram.no_save_data);
objProgram.in_past = argument0;
objProgram.current_level = argument1;

if(objProgram.in_past)
{
    show_debug_message("PAST "+string(objProgram.current_level));
}
else
{
    show_debug_message("FUTURE "+string(objProgram.current_level));
}


level_goto_next();
