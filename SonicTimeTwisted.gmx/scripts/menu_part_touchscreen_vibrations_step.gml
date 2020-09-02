menu_fn_step_default();
if(state == 17)
{
    switch(confirmation_index)
    {
         case 1:
             objProgram.inputManager.haptics_duration = menu_fn_sync_slider(objProgram.inputManager.haptics_duration);
             break;
         case 2:
             objProgram.inputManager.haptics_strength = menu_fn_sync_slider(objProgram.inputManager.haptics_strength);
             break;
         case 4:
             var multiplied = round(objProgram.inputManager.rumble_strength*100);
             multiplied = menu_fn_sync_slider(multiplied);
             objProgram.inputManager.rumble_strength = multiplied/100;
             break;
    }
}
