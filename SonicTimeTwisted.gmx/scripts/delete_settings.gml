//delete_settings

if eas_file_exists("settings.ini") {
    eas_file_delete("settings.ini");
}

with objProgram.inputManager input_load();
