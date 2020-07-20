///eas_file_is_read(handle)
gml_pragma("forceinline"); // it's recommended to inline one-line scripts for YYC.
return ds_map_find_value(argument0, "is_read");
