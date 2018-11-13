//delete_settings
if file_exists(working_directory+"\settings.ini") {
    file_delete(working_directory+"\settings.ini");
}
if file_exists("settings.ini") {
    file_delete("settings.ini");
}
with objProgram.inputManager input_load();
