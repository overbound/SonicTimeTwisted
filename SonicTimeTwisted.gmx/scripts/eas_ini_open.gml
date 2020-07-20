///eas_ini_open(fname)

if (!global.EAS_needasync)
{
    ini_open(argument0); // ini_open returns nothing (void), YYC fix.
    return 0;
}

if (global.EAS_ini || global.EAS_ininame != "")
{
    eas_error("INI is already opened, please do eas_ini_close();");
}
else
{
    global.EAS_ini = true;
    global.EAS_ininame = eas_safe_path(argument0);
    global.EAS_iniempty = false;
    
    if (!ds_map_exists(global.EAS_map, global.EAS_ininame))
    {
        global.EAS_inidata = ""; // the ini doesn't exist.
        global.EAS_iniempty = true;
    }
    else
        global.EAS_inidata = ds_map_find_value(global.EAS_map, global.EAS_ininame); // the ini already exists.
        
    ini_open_from_string(global.EAS_inidata);
    eas_log("Opened INI " + global.EAS_ininame);
}

return 0;
