// input_check(control)
if (objProgram.inputManager.flag_player_input)
{
    return objProgram.inputManager.state_press & argument0;
}
else
{
    switch(argument0)
    {
    case cUP:
        if (objProgram.inputManager.computer_pressed_cUP) return true;
        break;
    case cDOWN:
        if (objProgram.inputManager.computer_pressed_cDOWN) return true;
        break;
    case cLEFT:
        if (objProgram.inputManager.computer_pressed_cLEFT) return true;
        break;
    case cRIGHT:
        if (objProgram.inputManager.computer_pressed_cRIGHT) return true;
        break;
    case cSTART:
        if (objProgram.inputManager.computer_pressed_cSTART) return true;
        break;
    case cACTION:
        if (objProgram.inputManager.computer_pressed_cA) return true;
        break;
    case cCANCEL:
        if (objProgram.inputManager.computer_pressed_cB) return true;
        break;
    case cCONFIRM:
        if (objProgram.inputManager.computer_pressed_cA || objProgram.inputManager.computer_pressed_cSTART) return true;
        break;
    default:
        return false;
        break;
    }
}
