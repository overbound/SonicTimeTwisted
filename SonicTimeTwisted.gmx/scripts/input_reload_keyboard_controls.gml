with(objProgram.inputManager)
{    
    var fileName = 'settings.ini';
    if(stt_file_exists(fileName))
    {
        stt_ini_open(fileName);
        input_load_keyboard_controls(true);
        stt_ini_close();
    }
    else
    {
        input_load_keyboard_controls(false);
    }
}
