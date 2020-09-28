menu_fn_step_default();
if(state == 17)
{
    if(objProgram.inputManager.gyromode == 0)
    {
        switch(items[cursor, 1])
        {
            case 1:
                var angle = round(radtodeg(objProgram.inputManager.gyro_switch_on_angle_x));
                angle = menu_fn_sync_slider(angle);
                objProgram.inputManager.gyro_switch_on_angle_x = degtorad(angle);
                break;
        }
    }
    else
    {
        switch(items[cursor, 1])
        {
            case 2:
                var angle = round(radtodeg(objProgram.inputManager.gyro_analog_start_x));
                angle = menu_fn_sync_slider(angle);
                objProgram.inputManager.gyro_analog_start_x = degtorad(angle);            
                break;
            case 3:
                var angle = round(radtodeg(objProgram.inputManager.gyro_analog_end_x));
                angle = menu_fn_sync_slider(angle);
                objProgram.inputManager.gyro_analog_end_x = degtorad(angle);            
                break;
        }
    }
}
