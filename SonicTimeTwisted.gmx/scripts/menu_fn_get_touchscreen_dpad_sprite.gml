// just for fun, make the dpad graphic depend on other options
// if gyroscope in special stages is deactivated and dpad is static, show the dpad (1)
// if gyroscope in special stages is activated and dpad is dynamic, show the UP button (2)
// else, show a combination of the two (0)
var dpadgraphic = 0;
if((!objProgram.inputManager.gyroinss) && (!objProgram.inputManager.dpadmode))
{
    dpadgraphic = 1;
}
else
if(objProgram.inputManager.gyroinss && objProgram.inputManager.dpadmode)
{
    dpadgraphic = 2;
}
switch(objProgram.inputManager.vksize)
{
    case 0:
        switch(dpadgraphic)
        {
            case 0:
                return sprTouchscreenDPadTemplate;
                break;
            case 1:
                return sprTouchscreenDPadBase;
                break;
            default:
                return sprTouchscreenRunButton;
                break;
        }
        break;
    case 1:
        switch(dpadgraphic)
        {
            case 0:
                return sprTouchscreenDPadTemplateMed;
                break;
            case 1:
                return sprTouchscreenDPadBaseMed;
                break;
            default:
                return sprTouchscreenRunButtonMed;
                break;
        }
        break;
    default:
        switch(dpadgraphic)
        {
            case 0:
                return sprTouchscreenDPadTemplateSmall;
                break;
            case 1:
                return sprTouchscreenDPadBaseSmall;
                break;
            default:
                return sprTouchscreenRunButtonSmall;
                break;
        }
        break;
}
