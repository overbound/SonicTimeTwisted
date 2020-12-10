menu_fn_step_default();
if(state == 17)
{
    switch(confirmation_index)
    {
        case 3:
            var value_multipled = round(objProgram.inputManager.vkalpha*100);
            value_multipled = menu_fn_sync_slider(value_multipled);
            objProgram.inputManager.vkalpha = value_multipled/100;        
        break;
        case 9:
            var value_multipled = round(objProgram.inputManager.vkdeadzone*100);
            value_multipled = menu_fn_sync_slider(value_multipled);
            objProgram.inputManager.vkdeadzone = value_multipled/100;        
        break;
    }

}
