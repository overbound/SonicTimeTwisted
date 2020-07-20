///eas_free()
// WARNING: This does not free file handles/ini files!

eas_log("Freeing structures...");

ds_map_destroy(global.EAS_map);
if (!is_undefined(global.EAS_buffer) && buffer_exists(global.EAS_buffer))
    buffer_delete(global.EAS_buffer);
