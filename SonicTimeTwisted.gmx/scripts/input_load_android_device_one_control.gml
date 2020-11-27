var backupValue = ini_read_real('android_input_controls_types', menu_fn_get_keymap_getkey(argument0)+'_backup', argument2);
if(backupValue > -1)
{
     android_map_input(0, argument0, backupValue);
}
android_map_input(0, argument0, ini_read_real('android_input_controls_types', menu_fn_get_keymap_getkey(argument0), argument1));
