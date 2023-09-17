with (objProgram) {
    if (objProgram.device_info & DEVICE_OS_PLAYSTATION) {
        stt_save_files();
    } else {
        save_options();
    }
}
