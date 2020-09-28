// keyboard
if(argument0) // argument0 - from INI, default values if false
{
    input_bind_key(round(ini_read_real('keyboard_controls','up',vk_up)), cUP);
    input_bind_key(round(ini_read_real('keyboard_controls', 'down', vk_down)), cDOWN);
    input_bind_key(round(ini_read_real('keyboard_controls', 'left', vk_left)), cLEFT);
    input_bind_key(round(ini_read_real('keyboard_controls', 'right', vk_right)), cRIGHT);
    input_bind_key(round(ini_read_real('keyboard_controls','a', ord('A'))), cA);
    input_bind_key(round(ini_read_real('keyboard_controls', 'b', ord('S'))), cB);
    input_bind_key(round(ini_read_real('keyboard_controls', 'c', ord('D'))), cC);
    input_bind_key(round(ini_read_real('keyboard_controls', 'start', vk_enter)), cSTART);
}
else
{
    input_bind_key(vk_up, cUP);
    input_bind_key(vk_down, cDOWN);
    input_bind_key(vk_left, cLEFT);
    input_bind_key(vk_right, cRIGHT);
    
    input_bind_key(ord('A'), cA);
    input_bind_key(ord('S'), cB);
    input_bind_key(ord('D'), cC);
    input_bind_key(vk_enter, cSTART);
}
