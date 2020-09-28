// input_check_released(control)
if (objProgram.inputManager.flag_player_input)
{
    return objProgram.inputManager.state_release & argument0;
}
else
{
    switch(argument0)
    {
    case cUP:
        if (!objProgram.inputManager.computer_cUP) return true;
        break;
    case cDOWN:
        if (!objProgram.inputManager.computer_cDOWN) return true;
        break;
    case cLEFT:
        if (!objProgram.inputManager.computer_cLEFT) return true;
        break;
    case cRIGHT:
        if (!objProgram.inputManager.computer_cRIGHT) return true;
        break;
    case cSTART:
        if (!objProgram.inputManager.computer_cSTART) return true;
        break;
    case cACTION:
        if (!objProgram.inputManager.computer_cA) return true;
        break;
    case cCANCEL:
        if (!objProgram.inputManager.computer_cB) return true;
        break;
    case cCONFIRM:
        if (!objProgram.inputManager.computer_cA || !objProgram.inputManager.computer_cSTART) return true;
        break;
    default:
        return false;
        break;
    }
}
