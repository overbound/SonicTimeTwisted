///eas_file_rename(filename, new_filename)
if (!global.EAS_needasync) return file_rename(argument0, argument1);

if (!eas_file_exists(argument0) || eas_file_exists(argument1)) return false;
else
{
    ds_map_replace(global.EAS_map, argument1, ds_map_find_value(global.EAS_map, argument0));
    eas_file_delete(argument0);
    return true;
}
