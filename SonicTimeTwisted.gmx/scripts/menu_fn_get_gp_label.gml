/// get button label to display on the configuration screen

//show_debug_message("argument0: "+string(argument0));
var fChar = string_char_at(string(argument0), 1);
if(fChar == "-" || fChar == "+")
{
    var axis = string_copy(string(argument0), 2, string_length(string(argument0)) - 1);
    axis = round(real(axis));
    
    //show_debug_message("axis found: "+string(axis));
    //show_debug_message("fchar: "+fChar);
    
    var axisLabel = "";
    switch(axis)
    {
        case gp_axislh:
        case gp_axislv:
            axisLabel = tr("LStick %d");
            break;
        case gp_axisrh:
        case gp_axisrv:
            axisLabel = tr("RStick %d");
            break;
    }
    switch(axis)
    {
        case gp_axislh:
        case gp_axisrh:
            if(fChar == "+")
            {
                axisLabel = string_replace(axisLabel, "%d", tr("Right"));
            }
            else
            {
                axisLabel = string_replace(axisLabel, "%d", tr("Left"));
            }
            break;
        case gp_axislv:
        case gp_axisrv:
            if(fChar == "+")
            {
                axisLabel = string_replace(axisLabel, "%d", tr("Down"));
            }
            else
            {
                axisLabel = string_replace(axisLabel, "%d", tr("Up"));
            }
            break;
    }
    return axisLabel;
}
else
{
    var code = round(real(argument0));   
    var descr = objProgram.inputManager.paddesc;
    if (descr == "sony dualshock 4")
    {
        switch(code)
        {             
            case gp_face1:
                 return tr("X");
                 break;
            case gp_face2:
                 return tr("O");
                 break;
            case gp_face3:
                 return tr("Square");
                 break;
            case gp_face4:
                 return tr("Triangle");
                 break;
            case gp_shoulderl:
                 return tr("L1");
                 break;
            case gp_shoulderlb:
                 return tr("L2");
                 break;
            case gp_shoulderr:
                 return tr("R1");
                 break;
            case gp_shoulderrb:
                 return tr("R2");
                 break;
            case gp_select:
                 return tr("Touchpad");
                 // this one is weird. on PS4 "Select" is a touchpad press. on PC it's inpressable.
                 // in GMS2 you can modify gamecontrollerdb directly and change the mapping to an actual SHARE button.
                 // but this is GM:S 1.4 so nope.
                 break;
            case gp_start:
                 return tr("Options");
                 break;
            case gp_stickl:
                 return tr("L3");
                 break;
            case gp_stickr:
                 return tr("R3");
                 break;
            case gp_padu:
                 return tr("DPad Up");
                 break;
            case gp_padd:
                 return tr("DPad Down");
                 break;
            case gp_padl:
                 return tr("DPad Left");
                 break;
            case gp_padr:
                 return tr("DPad Right");
                 break;
            default:
                 show_debug_message(string(argument0));
                 return string_replace("Other %k", "%k", string(argument0));
                 break;
             }
    }
    
    switch(code)
    {             
        case gp_face1:
             return tr("A");
             break;
        case gp_face2:
             return tr("B");
             break;
        case gp_face3:
             return tr("X");
             break;
        case gp_face4:
             return tr("Y");
             break;
        case gp_shoulderl:
             return tr("L1");
             break;
        case gp_shoulderlb:
             return tr("L2");
             break;
        case gp_shoulderr:
             return tr("R1");
             break;
        case gp_shoulderrb:
             return tr("R2");
             break;
        case gp_select:
             return tr("Select");
             break;
        case gp_start:
             return tr("Start");
             break;
        case gp_stickl:
             return tr("L3");
             break;
        case gp_stickr:
             return tr("R3");
             break;
        case gp_padu:
             return tr("DPad Up");
             break;
        case gp_padd:
             return tr("DPad Down");
             break;
        case gp_padl:
             return tr("DPad Left");
             break;
        case gp_padr:
             return tr("DPad Right");
             break;
        default:
             show_debug_message(string(argument0));
             return string_replace("Other %k", "%k", string(argument0));
             break;
         }
}
