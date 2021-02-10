///tr_reload_all()
//dangerous: force reloading of all translation files.

show_debug_message("Reloading all translations...");
ds_map_clear(global.TR_map);
tr_load_files();
tr_load_assets();
