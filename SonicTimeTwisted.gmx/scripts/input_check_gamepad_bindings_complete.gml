var complete = false;
with(objProgram.inputManager)
{
    var mappedUp = false;
    var mappedDown = false;
    var mappedLeft = false;
    var mappedRight = false;
    var mappedA = false;
    var mappedB = false;
    var mappedC = false;
    var mappedStart = false;
    var i;
    
    for(i = 0; i < axis_count; i++)
    {
        if(axis[i] > 0)
        {
            switch(axis_control[i])
            {
                case cUP:
                    mappedUp = true;
                    break;
                case cDOWN:
                    mappedDown = true;
                    break;
                case cLEFT:
                    mappedLeft = true;
                    break;
                case cRIGHT:
                    mappedRight = true;
                    break;
                case cA:
                    mappedA = true;
                    break;
                case cB:
                    mappedB = true;
                    break;
                case cC:
                    mappedC = true;
                    break;
                case cSTART:
                    mappedStart = true;
                    break;
            }
        }
    }
    
    for(var i = 0; i < button_count; i++)
    {
        if(button[i] > 0)
        {
            switch(button_control[i])
            {
                case cUP:
                    mappedUp = true;
                    break;
                case cDOWN:
                    mappedDown = true;
                    break;
                case cLEFT:
                    mappedLeft = true;
                    break;
                case cRIGHT:
                    mappedRight = true;
                    break;
                case cA:
                    mappedA = true;
                    break;
                case cB:
                    mappedB = true;
                    break;
                case cC:
                    mappedC = true;
                    break;
                case cSTART:
                    mappedStart = true;
                    break;
            }
        }
    }
    
    complete = mappedUp && mappedDown && mappedLeft && mappedRight
        && mappedA && mappedB && mappedC && mappedStart;
}

return complete;
