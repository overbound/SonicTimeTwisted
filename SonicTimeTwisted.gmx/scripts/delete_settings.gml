//delete_settings
if stt_file_exists("settings.ini") {
    stt_file_delete("settings.ini");
    stt_save_files();
}

with objProgram.inputManager input_load();
