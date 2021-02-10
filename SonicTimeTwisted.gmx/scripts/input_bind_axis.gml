/// input_bind_axis(gamepad, axis, direction, deadzone, control)

input_clear_gamepad_backup_mappings(argument4, argument0, 1, argument1, argument2);

axis_gamepad[axis_count] = argument0;
axis[axis_count] = argument1;
axis_direction[axis_count] = argument2;
axis_deadzone[axis_count] = argument3;
axis_control[axis_count] = argument4;

// saved reference to mapping, multiplied by 10 and increased by 1 so that the
// final digit 1 means "axis" and the rest refers to the index in axis* arrays
gamepad_mapping[gamepad_mapping_count] = axis_count*10 + 1;

axis_count += 1;
gamepad_mapping_count += 1;
show_debug_message("Axis mapped: "+string(argument4)+" <- "+string(argument1)+", direction "+string(argument3)+", deadzone "+string(argument2)+",  on GP "+string(argument0));
