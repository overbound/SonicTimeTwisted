///check_configuration()
// For those people who are going to make mods for Sonic Time Twisted.

if (string_lower(os_get_config()) == "default") {
    show_message_async("It's not recommended to build this game in Default configuration, rather, make your own.");
    return false;
}
else {
    return true;
}
