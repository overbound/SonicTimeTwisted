// Array indices: 0 - button code, 1 - delta x, 2 - delta y
// Button codes: 0 - none, 1 - dpad, 2 - jump, 3 - pause, 4 - super
if(!is_array(temporary_variable))
{
    // mouse presses
    temporary_variable[0, 0] = 0;
    temporary_variable[0, 1] = 0;
    temporary_variable[0, 2] = 0;
    temporary_variable[1, 0] = 0;
    temporary_variable[1, 1] = 0;
    temporary_variable[1, 2] = 0;
    temporary_variable[2, 0] = 0;
    temporary_variable[2, 1] = 0;
    temporary_variable[2, 2] = 0;
    temporary_variable[3, 0] = 0;
    temporary_variable[3, 1] = 0;
    temporary_variable[3, 2] = 0;
    temporary_variable[4, 0] = 0;
    temporary_variable[4, 1] = 0;
    temporary_variable[4, 2] = 0;
    
    // position buffers
    temporary_variable[5, 0] = 1;
    temporary_variable[5, 1] = objProgram.inputManager.dpadx;
    temporary_variable[5, 2] = objProgram.inputManager.dpady;
    temporary_variable[6, 0] = 2;
    temporary_variable[6, 1] = objProgram.inputManager.bax;
    temporary_variable[6, 2] = objProgram.inputManager.bay;
    temporary_variable[7, 0] = 3;
    temporary_variable[7, 1] = objProgram.inputManager.bsx;
    temporary_variable[7, 2] = objProgram.inputManager.bsy;
    temporary_variable[8, 0] = 4;
    temporary_variable[8, 1] = objProgram.inputManager.bbx;
    temporary_variable[8, 2] = objProgram.inputManager.bby;
}
if(state == 2)
{
    // nothing?
}
else
{
    menu_fn_step_default();
}
