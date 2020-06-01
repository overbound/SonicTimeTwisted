switch(objProgram.inputManager.vksize)
{
    case 0:
        return sprTouchscreenButton;
        break;
    case 1:
        return sprTouchscreenButtonMed;
        break;
    default:
        return sprTouchscreenButtonSmall;
        break;
}
