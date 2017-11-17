/// get button label to display on the configuration screen

var code = round(real(argument0));
switch(code)
{
    case vk_add:
         return "ADD";
         break;
    case vk_alt:
         return "ALT";
         break;
    case vk_backspace:
         return "BACKSPACE";
         break;
    case vk_control:
         return "CTRL";
         break;
    case vk_decimal:
         return "DECIMAL";
         break;
    case vk_delete:
         return "DELETE";
         break;
    case vk_divide:
         return "DIVIDE";
         break;
    case vk_down:
         return "DOWN";
         break;
    case vk_end:
         return "END";
         break;
    case vk_enter:
         return "ENTER";
         break;
    case vk_escape:
         return "ESCAPE";
         break;
    case vk_f1:
         return "F1";
         break;
    case vk_f2:
         return "F2";
         break;
    case vk_f3:
         return "F3";
         break;
    case vk_f4:
         return "F4";
         break;
    case vk_f5:
         return "F5";
         break;
    case vk_f6:
         return "F6";
         break;
    case vk_f7:
         return "F7";
         break;
    case vk_f8:
         return "F8";
         break;
    case vk_f9:
         return "F9";
         break;
    case vk_f10:
         return "F10";
         break;
    case vk_f11:
         return "F11";
         break;
    case vk_f12:
         return "F12";
         break;
    case vk_home:
         return "HOME";
         break;
    case vk_insert:
         return "INSERT";
         break;
    case vk_lalt:
         return "LEFT ALT";
         break;
    case vk_lcontrol:
         return "LEFT CTRL";
         break;
    case vk_left:
         return "LEFT";
         break;
    case vk_lshift:
         return "LEFT SHIFT";
         break;
    case vk_multiply:
         return "MULTIPLY";
         break;
    case vk_numpad0:
         return "NUMPAD 0";
         break;
    case vk_numpad1:
         return "NUMPAD 1";
         break;
    case vk_numpad2:
         return "NUMPAD 2";
         break;
    case vk_numpad3:
         return "NUMPAD 3";
         break;
    case vk_numpad4:
         return "NUMPAD 4";
         break;
    case vk_numpad5:
         return "NUMPAD 5";
         break;
    case vk_numpad6:
         return "NUMPAD 6";
         break;
    case vk_numpad7:
         return "NUMPAD 7";
         break;
    case vk_numpad8:
         return "NUMPAD 8";
         break;
    case vk_numpad9:
         return "NUMPAD 9";
         break;
    case vk_pagedown:
         return "PAGE DOWN";
         break;
    case vk_pageup:
         return "PAGE UP";
         break;
    case vk_printscreen:
         return "PRINT SCREEN";
         break;
    case vk_ralt:
         return "RIGHT ALT";
         break;
    case vk_rcontrol:
         return "RIGHT CONTROL";
         break;
    case vk_right:
         return "RIGHT";
         break;
    case vk_rshift:
         return "RIGHT SHIFT";
         break;
    case vk_shift:
         return "SHIFT";
         break;
    case vk_space:
         return "SPACE";
         break;
    case vk_subtract:
         return "SUBSTRACT";
         break;
    case vk_tab:
         return "TAB";
         break;
    case vk_up:
         return "UP";
         break;
         
    default:
         if(code >= ord("A") && code <= ord("Z"))
         {
             return chr(code) + " KEY";
         }
         else
         {
             if(code >= ord("0") && code <= ord("9"))
             {
                 return chr(code) + " KEY";
             }
             else
             {
                 return "OTHER "+string(code);
             }
         }
         
}
