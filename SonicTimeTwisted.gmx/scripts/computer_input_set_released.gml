switch(argument0)
{
case cUP:
    objProgram.inputManager.computer_cUP = false;
    break;
case cDOWN:
    objProgram.inputManager.computer_cDOWN = false;
    break;
case cLEFT:
    objProgram.inputManager.computer_cLEFT = false;
    break;
case cRIGHT:
    objProgram.inputManager.computer_cRIGHT = false;
    break;
case cSTART:
    objProgram.inputManager.computer_cSTART = false;
    break;
case cACTION:
    objProgram.inputManager.computer_cA = false;
    break;
case cCANCEL:
    objProgram.inputManager.computer_cB = false;
    break;
case cCONFIRM:
    objProgram.inputManager.computer_cA = false;
    objProgram.inputManager.computer_cSTART = false;
    break;
default:
    break;
}
