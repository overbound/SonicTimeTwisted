///eas_safe_path(string)
gml_pragma("forceinline"); // it's recommended to inline one-line scripts for YYC.

//Returns a sanitized path. (replaces working_directory and game_save_id with "")
return string_lower(string_replace(string_replace(argument0, working_directory, ""), game_save_id, ""));
