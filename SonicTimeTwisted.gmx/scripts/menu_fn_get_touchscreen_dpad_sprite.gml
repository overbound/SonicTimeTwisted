switch(objProgram.inputManager.vksize)
{
    case 0:
        return sprTouchscreenDPadBaseBig;
        break;
    case 1:
        return sprTouchscreenDPadBaseMed;
        break;
    default:
        return sprTouchscreenDPadBaseSmall;
        break;
}
