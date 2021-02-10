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
    
    for(var i = 0; i < key_count; i++)
    {
        if(key[i] > 0)
        {
            switch(key_control[i])
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
