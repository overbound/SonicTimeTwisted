extends Node

var console : TextEdit
var console_initialized : bool = false

func init_console(console_node : TextEdit):
    if !console_initialized:
        console = console_node
        console_initialized = true

func _ready():
    pass

func get_parsed_json_if_exists(path : String):
    if !FileAccess.file_exists(path):
        return null
    return JSON.parse_string(FileAccess.get_file_as_string(path))

func log_to_console(message : String):
    if console.text == "":
        console.text = message
    else:    
        console.text = console.text+"\n"+message
    console.scroll_vertical = console.get_line_count()

func delete_directory_contents(path : String, log_prefix : String = "") -> void:
    var child_log_prefix
    if log_prefix == "":
        log_to_console(tr("Deleting existing contents at ")+path)
        
    var directories = DirAccess.get_directories_at(path)
    for directory in directories:
        if log_prefix == "":
            child_log_prefix = directory
        else:
            child_log_prefix = log_prefix+"/"+directory
        delete_directory_contents(path+"/"+directory, child_log_prefix)
        DirAccess.remove_absolute(path+"/"+directory)
        log_to_console(tr("Directory deleted: ")+log_prefix+"/"+directory)
    var files = DirAccess.get_files_at(path)
    for file in files:
        DirAccess.remove_absolute(path+"/"+file)   
        if log_prefix == "":
            log_to_console(tr("File deleted: ")+file)
        else:
            log_to_console(tr("File deleted: ")+log_prefix+"/"+file)

func collect_files(path : String, prefix : String = "") -> PackedStringArray:
    var result = PackedStringArray()
    var directories = DirAccess.get_directories_at(path)
    for directory in directories:
        var child_prefix
        if prefix == "":
            child_prefix = directory+"/"
        else:
            child_prefix = prefix+"/"+directory+"/"
        result.append_array(collect_files(path+"/"+directory, child_prefix))
    var files = DirAccess.get_files_at(path)
    for file in files:
        result.append(prefix+file)
    return result

func get_project_extensions_dir() -> String:
    match Context.get_project_version():
        1:
            return Context.get_project_path()+"/SonicTimeTwisted.gmx/extensions"
        2:
            return Context.get_project_path()+"/src/extensions"
        _:
            return ""

func get_project_datafiles_dir() -> String:
    match Context.get_project_version():
        1:
            return Context.get_project_path()+"/SonicTimeTwisted.gmx/datafiles"
        2:
            return Context.get_project_path()+"/src/datafiles"
        _:
            return ""

func get_project_tools_dir() -> String:
    match Context.get_project_version():
        1:
            return Context.get_project_path()+"/extras"
        2:
            return Context.get_project_path()+"/tools"
        _:
            return ""

func get_locales_list() -> PackedStringArray:
    var locales = PackedStringArray()
    var locales_raw = FileAccess.get_file_as_string(get_project_datafiles_dir()+"/translations.txt")
    if !locales_raw:
        log_to_console(tr("Could not parse locales"))
        return locales
    var locales_names = locales_raw.split("\n")
    for locale in locales_names:
        locale = locale.strip_edges()
        if locale != "" && locale != "English":
            locales.append(locale)
    return locales
