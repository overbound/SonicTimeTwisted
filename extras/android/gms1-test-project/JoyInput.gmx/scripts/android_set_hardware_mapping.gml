/// Read the hardware mapping for the player 
// argument0 - player 0 or 1
var a = argument0;

add_console_output("Starting HW mapping");
add_console_output("");

var file = file_find_first("android\gamepad\*.csv", 0);

sttandroid_gamepad_hwmap_start(0);
while (file != "")
{
    if(file_exists("android\gamepad\"+file))
    {
        sttandroid_gamepad_hwmap_newfile();
        fileHandle = file_text_open_read("android\gamepad\"+file);
        while(!file_text_eof(fileHandle))
        {
            var row = file_text_read_string(fileHandle);
            file_text_readln(fileHandle);
            sttandroid_gamepad_hwmap_feed_row(row);
        }
    }
    file = file_find_next();
}
file_find_close();
sttandroid_gamepad_hwmap_finish();
