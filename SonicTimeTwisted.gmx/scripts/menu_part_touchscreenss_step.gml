menu_fn_step_default();
if(state == 17)
{
    switch(confirmation_index)
    {
        case 1:
            var value_multipled = round(objProgram.inputManager.vkdeadzoness*100);
            value_multipled = menu_fn_sync_slider(value_multipled);
            objProgram.inputManager.vkdeadzoness = value_multipled/100;        
        break;
    }

}
