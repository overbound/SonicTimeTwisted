var file = file_find_first("android\gamepad\*.csv", 0);

sttandroid_gamepad_hwmap_start(argument0);
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
        file_text_close(fileHandle);
    }
    file = file_find_next();
}
file_find_close();
sttandroid_gamepad_hwmap_finish();
