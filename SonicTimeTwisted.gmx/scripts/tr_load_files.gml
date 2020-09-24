///tr_load_files()

var _sep = "/";
if (os_type == os_windows) _sep = "\";

if (DEVICE_SUPPORTS_FILE_FIND)
{
    var _fname = file_find_first("translations" + _sep + "*.json", false);
    if (_fname == -1)
    {
        file_find_close();
        return false;
    }
    
    while (_fname != "")
    {
        tr_load_file("translations" + _sep + _fname);
        _fname = file_find_next();
    }
    
    file_find_close();
    
    return true;
}
else // some devices don't like when you try to enumerate existing files (PS4 and basically all consoles)
{
    var _flist = file_text_open_read("translations.txt");
    if (_flist == -1) return false;
    while (!file_text_eof(_flist))
    {
        var _fname = "translations" + _sep + file_text_read_string(_flist) + ".json";
        tr_load_file(_fname);
        file_text_readln(_flist);
    }
    file_text_close(_flist);
    
    return true;
}
