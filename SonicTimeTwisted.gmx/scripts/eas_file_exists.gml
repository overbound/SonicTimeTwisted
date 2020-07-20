///eas_file_exists(filename)
if (!global.EAS_needasync) return file_exists(argument0);

return ds_map_exists(global.EAS_map, eas_safe_path(argument0));
