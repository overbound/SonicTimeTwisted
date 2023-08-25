menu_fn_step_default();
if(state == 17)
{
    switch(confirmation_index)
    {
        case 3:
            var value_multipled = round(objProgram.inputManager.gpanalog_deadzone_min*100);
            value_multipled = menu_fn_sync_slider(value_multipled);
            objProgram.inputManager.gpanalog_deadzone_min = value_multipled/100;        
        break;
        case 4:
            var value_multipled = round(objProgram.inputManager.gpanalog_deadzone_max*100);
            value_multipled = menu_fn_sync_slider(value_multipled);
            objProgram.inputManager.gpanalog_deadzone_max = value_multipled/100;        
        break;
        case 5:
            objProgram.inputManager.gpanalog_ss_min_angle = menu_fn_sync_slider(objProgram.inputManager.gpanalog_ss_min_angle);
        break;
        case 6:
            objProgram.inputManager.gpanalog_ss_max_angle = menu_fn_sync_slider(objProgram.inputManager.gpanalog_ss_max_angle);
        break;
    }

}
