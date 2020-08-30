var hint = instance_create(0, 0, objInputHelp);
hint.hint = tr("Point on the screen");
input_manage_script = input_method_ggpoint();
input_rumble_manage_script = input_method_haptics_ggpoint;
input_draw_script = input_method_draw_ggpoint;
