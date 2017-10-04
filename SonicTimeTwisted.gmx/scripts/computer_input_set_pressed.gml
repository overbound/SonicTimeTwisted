switch(argument0)
{
case cUP:
    objInput.computer_pressed_cUP = true;
    objInput.computer_cUP = true;
    objInput.computer_cDOWN = false;
    break;
case cDOWN:
    objInput.computer_pressed_cDOWN = true;
    objInput.computer_cDOWN = true;
    objInput.computer_cUP = false;
    break;
case cLEFT:
    objInput.computer_pressed_cLEFT = true;
    objInput.computer_cLEFT = true;
    objInput.computer_cRIGHT = false;
    break;
case cRIGHT:
    objInput.computer_pressed_cRIGHT = true;
    objInput.computer_cRIGHT = true;
    objInput.computer_cLEFT = false;
    break;
case cSTART:
    objInput.computer_pressed_cSTART = true;
    objInput.computer_cSTART = true;
    break;
case cACTION:
    objInput.computer_pressed_cA = true;
    objInput.computer_cA = true;
    break;
case cCANCEL:
    objInput.computer_pressed_cB = true;
    objInput.computer_cB = true;
    break;
case cCONFIRM:
    objInput.computer_pressed_cA = true;
    objInput.computer_cA = true;
    break;
default:
    break;
}
