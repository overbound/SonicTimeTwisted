// load_gamepad_support()
var file = 'settings.ini';
if (file_exists(file)) {
    ini_open(file);
    gamepad_update_enabled=real(ini_read_string('gamepad_controls','gamepadEnabled','1'));
    ini_close();
}
