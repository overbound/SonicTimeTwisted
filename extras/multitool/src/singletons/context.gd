extends Node

var stt_version : int = 0
var project_path : String = ""

signal project_reloaded

func _init():
    load_config()

func load_config():
    var config = ConfigFile.new()
    var err = config.load("user://project.cfg")
    if err != OK || (!config.has_section_key("project", "path")):
        project_path = ""
        stt_version = 0
    else:
        stt_version = set_project_path(config.get_value("project", "path", ""))
        project_reloaded.emit()
    
func save_config():
    var config = ConfigFile.new()
    config.set_value("project", "path", project_path)
    config.save("user://project.cfg")

func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func get_project_path() -> String:
    if project_path.length() > 0 && DirAccess.dir_exists_absolute(project_path):
        return project_path
    return ""
    
func set_project_path(path : String) -> int:
    if DirAccess.dir_exists_absolute(path+"/SonicTimeTwisted.gmx/datafiles/translations"):
        if DirAccess.dir_exists_absolute(path+"/SonicTimeTwisted.gmx/extensions/SttAndroid/AndroidSource/Java"):
            project_path = path
            stt_version = 1
            save_config()
            return 1
    if DirAccess.dir_exists_absolute(path+"/src/datafiles/translations"):
        if DirAccess.dir_exists_absolute(path+"/src/extensions/SttAndroid/AndroidSource/Java"):
            project_path = path
            stt_version = 2
            save_config()
            return 2
    return 0

func get_project_version() -> int:
    return stt_version
