///eas_file_copy(filename, new_filename)
if (!global.EAS_needasync) return file_copy(argument0, argument1);

if (!eas_file_exists(argument0)) return false;
else
{
    ds_map_replace(global.EAS_map, argument1, ds_map_find_value(global.EAS_map, argument0));
    return true;
}
