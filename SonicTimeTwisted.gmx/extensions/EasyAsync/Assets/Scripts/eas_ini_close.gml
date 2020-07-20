///eas_ini_close(fname)

if (!global.EAS_needasync) return ini_close();

if (!global.EAS_ini || global.EAS_ininame == "")
{
    eas_error("No INI was opened! Please do eas_ini_open(fname); first");
}
else
{
    var _inistring = ini_close();
    ds_map_replace(global.EAS_map, global.EAS_ininame, _inistring);
    eas_log("Closed INI " + global.EAS_ininame);
    
    global.EAS_ini = false;
    global.EAS_ininame = "";
    global.EAS_inidata = "";
    
    return _inistring;
}
