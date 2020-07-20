///eas_file_delete(filename)
if (!global.EAS_needasync) return file_delete(argument0);

ds_map_delete(global.EAS_map, eas_safe_path(argument0));
