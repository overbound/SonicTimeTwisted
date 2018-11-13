switch(argument0)
{
case cUP:
    objProgram.inputManager.computer_pressed_cUP = true;
    objProgram.inputManager.computer_cUP = true;
    objProgram.inputManager.computer_cDOWN = false;
    break;
case cDOWN:
    objProgram.inputManager.computer_pressed_cDOWN = true;
    objProgram.inputManager.computer_cDOWN = true;
    objProgram.inputManager.computer_cUP = false;
    break;
case cLEFT:
    objProgram.inputManager.computer_pressed_cLEFT = true;
    objProgram.inputManager.computer_cLEFT = true;
    objProgram.inputManager.computer_cRIGHT = false;
    break;
case cRIGHT:
    objProgram.inputManager.computer_pressed_cRIGHT = true;
    objProgram.inputManager.computer_cRIGHT = true;
    objProgram.inputManager.computer_cLEFT = false;
    break;
case cSTART:
    objProgram.inputManager.computer_pressed_cSTART = true;
    objProgram.inputManager.computer_cSTART = true;
    break;
case cACTION:
    objProgram.inputManager.computer_pressed_cA = true;
    objProgram.inputManager.computer_cA = true;
    break;
case cCANCEL:
    objProgram.inputManager.computer_pressed_cB = true;
    objProgram.inputManager.computer_cB = true;
    break;
case cCONFIRM:
    objProgram.inputManager.computer_pressed_cA = true;
    objProgram.inputManager.computer_cA = true;
    break;
default:
    break;
}
