extends "res://singletons/abstract_helper.gd"


const EXCLUDED_FILES : PackedStringArray = ["ExtensionBase.java", "MainActivity.java"]
const SOURCE_NAMESPACE : String = "com.example.sttandroid"
const COMMENT_MACRO : String = "// !DO NOT ERASE OR EDIT THIS LINE! "

func get_android_project_src_path() -> String:
    if Context.get_project_version() == 0:
        return ""
    return get_project_tools_dir()+"/android/android-studio-project/src"

func get_android_java_path() -> String:
    var path = get_android_project_src_path()
    if path == "":
        return ""
    return path + "/app/src/main/java/com/example/sttandroid"

func get_gm_java_path() -> String:
    if Context.get_project_version() == 0:
        return ""
    return get_project_extensions_dir()+"/SttAndroid/AndroidSource/Java"

func start_copy(console_node : TextEdit):
    init_console(console_node)
    console.text = ""
    if Context.get_project_version() == 0:
        log_to_console("Select a project first!")
        return
    delete_directory_contents(get_gm_java_path())
    var files_to_copy = collect_files(get_android_java_path())
    log_to_console(tr("Copying files"))
    for file in files_to_copy:
        log_to_console(file)
        if EXCLUDED_FILES.has(file):
            log_to_console("Excluded")
            continue
        # not copying, actually rewriting to replace instances of namespace
        var source = FileAccess.get_file_as_string(get_android_java_path()+"/"+file)
        create_parent_directory(get_gm_java_path()+"/"+file)
        var destination = FileAccess.open(get_gm_java_path()+"/"+file, FileAccess.WRITE)
        var source_lines = source.split("\n")
        var destination_lines = PackedStringArray()
        for source_line in source_lines:
            
            if source_line.begins_with(COMMENT_MACRO):
                source_line = source_line.substr(COMMENT_MACRO.length())
                
            if source_line.contains(SOURCE_NAMESPACE) && (source_line.begins_with("package ") || source_line.begins_with("import ")):
                source_line = source_line.replace(SOURCE_NAMESPACE, "${YYAndroidPackageName}")
                
            destination.store_string(source_line+"\n")
        log_to_console("OK")
    log_to_console("\n\nALL GOOD!")

func create_parent_directory(path : String) -> void:
    var path_parts : PackedStringArray
    path_parts = path.split("/")
    var dir = "/".join(path_parts.slice(0, path_parts.size() - 1))
    if !DirAccess.dir_exists_absolute(dir):
        DirAccess.make_dir_recursive_absolute(dir)
    
    
