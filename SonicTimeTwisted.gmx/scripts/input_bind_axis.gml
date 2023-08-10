/// input_bind_axis(gamepad, axis, direction, control)

input_clear_gamepad_backup_mappings(argument3, argument0, 1, argument1, argument2);

axis_gamepad[axis_count] = argument0;
axis[axis_count] = argument1;
axis_direction[axis_count] = argument2;
axis_control[axis_count] = argument3;

// saved reference to mapping, multiplied by 10 and increased by 1 so that the
// final digit 1 means "axis" and the rest refers to the index in axis* arrays
gamepad_mapping[gamepad_mapping_count] = axis_count*10 + 1;

axis_count += 1;
gamepad_mapping_count += 1;
show_debug_message("Axis mapped: "+string(argument3)+" <- "+string(argument1)+", direction "+string(argument2)+" on GP "+string(argument0));
