//delete_settings
if file_exists("settings.ini") {
    file_delete("settings.ini");
}

with objProgram.inputManager input_load();
