/// get button label to display on the configuration screen


show_debug_message("argument0: "+string(argument0));
var fChar = string_char_at(string(argument0), 1);
if(fChar == "-" || fChar == "+")
{
    var axis = string_copy(string(argument0), 2, string_length(string(argument0)) - 1);
    axis = round(real(axis));
    
    show_debug_message("axis found: "+string(axis));
    show_debug_message("fchar: "+fChar);
    
    var axisLabel = "";
    switch(axis)
    {
        case gp_axislh:
        case gp_axislv:
            axisLabel = "LSTICK";
            break;
        case gp_axisrh:
        case gp_axisrv:
            axisLabel = "RSTICK";
            break;
    }
    switch(axis)
    {
        case gp_axislh:
        case gp_axisrh:
            if(fChar == "+")
            {
                axisLabel += " RIGHT";
            }
            else
            {
                axisLabel += " LEFT";
            }
            break;
        case gp_axislv:
        case gp_axisrv:
            if(fChar == "+")
            {
                axisLabel += " DOWN";
            }
            else
            {
                axisLabel += " UP";
            }
            break;
    }
    return axisLabel;
}
else
{
    var code = round(real(argument0));   
    switch(code)
    {             
        case gp_face1:
             return "A";
             break;
        case gp_face2:
             return "B";
             break;
        case gp_face3:
             return "X";
             break;
        case gp_face4:
             return "Y";
             break;
        case gp_shoulderl:
             return "LEFT SHLD BT";
             break;
        case gp_shoulderlb:
             return "LEFT TRIGGER";
             break;
        case gp_shoulderr:
             return "RIGHT SHLD BT";
             break;
        case gp_shoulderrb:
             return "RIGHT TRIGGER";
             break;
        case gp_select:
             return "SELECT";
             break;
        case gp_start:
             return "START";
             break;
        case gp_stickl:
             return "LEFT STICK";
             break;
        case gp_stickr:
             return "RIGHT STICK";
             break;
        case gp_padu:
             return "DPAD UP";
             break;
        case gp_padd:
             return "DPAD DOWN";
             break;
        case gp_padl:
             return "DPAD LEFT";
             break;
        case gp_padr:
             return "DPAD RIGHT";
             break;
        default:
             show_debug_message(string(argument0));
             return "UNKNOWN";
             break;
         }
}
