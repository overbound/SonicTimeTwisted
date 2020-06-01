menu_fn_step_default();
if(state == 17)
{
    var vkalpha_multiplied = round(objProgram.inputManager.vkalpha*100);
    vkalpha_multiplied = menu_fn_sync_slider(vkalpha_multiplied);
    objProgram.inputManager.vkalpha = vkalpha_multiplied/100;
}
