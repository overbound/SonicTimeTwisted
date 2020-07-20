///eas_file_bin_size(binfile)
if (!global.EAS_needasync) return file_bin_size(argument0);

return buffer_get_size(ds_map_find_value(argument0, "buffer"));
