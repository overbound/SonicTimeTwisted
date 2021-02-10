///input_bind_button(gamepad, button, control)

input_clear_gamepad_backup_mappings(argument2, argument0, 0, argument1, 0);

button_gamepad[button_count] = argument0;
button[button_count] = argument1;
button_control[button_count] = argument2;

// saved reference to mapping, multiplied by 10 so that the
// final digit 0 means "button" and the rest refers to the index in button* arrays
gamepad_mapping[gamepad_mapping_count] = button_count*10;

button_count += 1;
gamepad_mapping_count += 1;
show_debug_message("Button mapped: "+string(argument2)+" <- "+string(argument1)+" on GP "+string(argument0));
