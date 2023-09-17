//delete_settings

if stt_file_exists("settings.ini") {
    stt_file_delete("settings.ini");
}
load_options_platform_dependant();
save_options_platform_dependant();
with objProgram.inputManager input_load();
apply_video_settings();
