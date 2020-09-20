/// get button label to display on the configuration screen
var code = round(real(argument0));
switch(code)
{
    case vk_add:
         return tr("Add");
         break;
    case vk_alt:
         return tr("Alt");
         break;
    case vk_backspace:
         return tr("Backspace");
         break;
    case vk_control:
         return tr("Ctrl");
         break;
    case vk_decimal:
         return tr("Decimal");
         break;
    case vk_delete:
         return tr("Delete");
         break;
    case vk_divide:
         return tr("Divide");
         break;
    case vk_down:
         return tr("Down");
         break;
    case vk_end:
         return tr("End");
         break;
    case vk_enter:
         return tr("Enter");
         break;
    case vk_escape:
         return tr("Escape");
         break;
    case vk_f1:
         return tr("F1");
         break;
    case vk_f2:
         return tr("F2");
         break;
    case vk_f3:
         return tr("F3");
         break;
    case vk_f4:
         return tr("F4");
         break;
    case vk_f5:
         return tr("F5");
         break;
    case vk_f6:
         return tr("F6");
         break;
    case vk_f7:
         return tr("F7");
         break;
    case vk_f8:
         return tr("F8");
         break;
    case vk_f9:
         return tr("F9");
         break;
    case vk_f10:
         return tr("F10");
         break;
    case vk_f11:
         return tr("F11");
         break;
    case vk_f12:
         return tr("F12");
         break;
    case vk_home:
         return tr("Home");
         break;
    case vk_insert:
         return tr("Insert");
         break;
    case vk_lalt:
         return tr("Left Alt");
         break;
    case vk_lcontrol:
         return tr("Left Ctrl");
         break;
    case vk_left:
         return tr("Left");
         break;
    case vk_lshift:
         return tr("Left Shift");
         break;
    case vk_multiply:
         return tr("Multiply");
         break;
    case vk_numpad0:
         return tr("Numpad 0");
         break;
    case vk_numpad1:
         return tr("Numpad 1");
         break;
    case vk_numpad2:
         return tr("Numpad 2");
         break;
    case vk_numpad3:
         return tr("Numpad 3");
         break;
    case vk_numpad4:
         return tr("Numpad 4");
         break;
    case vk_numpad5:
         return tr("Numpad 5");
         break;
    case vk_numpad6:
         return tr("Numpad 6");
         break;
    case vk_numpad7:
         return tr("Numpad 7");
         break;
    case vk_numpad8:
         return tr("Numpad 8");
         break;
    case vk_numpad9:
         return tr("Numpad 9");
         break;
    case vk_pagedown:
         return tr("Page Down");
         break;
    case vk_pageup:
         return tr("Page Up");
         break;
    case vk_printscreen:
         return tr("Print Screen");
         break;
    case vk_ralt:
         return tr("Right Alt");
         break;
    case vk_rcontrol:
         return tr("Right Ctrl");
         break;
    case vk_right:
         return tr("Right");
         break;
    case vk_rshift:
         return tr("Right Shift");
         break;
    case vk_shift:
         return tr("Shift");
         break;
    case vk_space:
         return tr("Space");
         break;
    case vk_subtract:
         return tr("Subtract");
         break;
    case vk_tab:
         return tr("Tab");
         break;
    case vk_up:
         return tr("Up");
         break;
         
    default:
         if(code >= ord("A") && code <= ord("Z"))
         {
             return string_replace("%k Key", "%k", chr(code));
         }
         else
         {
             if(code >= ord("0") && code <= ord("9"))
             {
                 return string_replace("%k Key", "%k", chr(code));
             }
             else
             {
                 return string_replace("Other %k", "%k", string(code));
             }
         }
         
}
