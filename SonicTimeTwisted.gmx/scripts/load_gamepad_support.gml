// load_gamepad_support()
var file = 'settings.ini';
if (eas_file_exists(file)) {
    eas_ini_open(file);
    gamepad_update_enabled=real(ini_read_string('gamepad_controls','gamepadEnabled','1'));
    eas_ini_close();
}
