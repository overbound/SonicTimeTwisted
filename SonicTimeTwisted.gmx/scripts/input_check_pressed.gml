// input_check(control)
if (objInput.flag_player_input)
{
    return objInput.state_press & argument0;
}
else
{
    switch(argument0)
    {
    case cUP:
        if (objInput.computer_pressed_cUP) return true;
        break;
    case cDOWN:
        if (objInput.computer_pressed_cDOWN) return true;
        break;
    case cLEFT:
        if (objInput.computer_pressed_cLEFT) return true;
        break;
    case cRIGHT:
        if (objInput.computer_pressed_cRIGHT) return true;
        break;
    case cSTART:
        if (objInput.computer_pressed_cSTART) return true;
        break;
    case cACTION:
        if (objInput.computer_pressed_cA) return true;
        break;
    case cCANCEL:
        if (objInput.computer_pressed_cB) return true;
        break;
    case cCONFIRM:
        if (objInput.computer_pressed_cA || objInput.computer_pressed_cSTART) return true;
        break;
    default:
        return false;
        break;
    }
}
