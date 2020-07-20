///eas_file_bin_position(binfile)
if (!global.EAS_needasync) return file_bin_position(argument0);

return buffer_tell(ds_map_find_value(argument0, "buffer"));
