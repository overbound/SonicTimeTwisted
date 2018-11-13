/// input_bind_axis(gamepad, axis, direction, deadzone, control)
axis_gamepad[axis_count] = argument0;
axis[axis_count] = argument1;
axis_direction[axis_count] = argument2;
axis_deadzone[axis_count] = argument3;
axis_control[axis_count] = argument4;
axis_count += 1;
show_debug_message(string(argument0) + ", " + string(argument1) + ", " + string(argument2) + ", " + string(argument3) + ", " + string(argument4));
