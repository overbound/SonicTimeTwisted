///get_path_sep()
// Returns the path separator used on the current platform.

if (((os_type == os_windows) || (os_type == os_uwp) || (os_type == os_winphone)) && (os_browser == browser_not_a_browser)) {
    return "\";
}
else {
    return "/";
}
