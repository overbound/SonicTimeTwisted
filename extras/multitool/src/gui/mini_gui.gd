extends Control

var path_input : LineEdit
var status_version_label : Label
var console : TextEdit
var project_path_browse_window : FileDialog
var project_path_browse_alert : AcceptDialog

# Called when the node enters the scene tree for the first time.
func _ready():
    path_input = get_node("Panel/MainHBox/VBoxContainer/ProjectPathGrid/Path/PathInput")
    status_version_label = get_node("Panel/MainHBox/VBoxContainer/ProjectPathGrid/StatusVersionLabel")
    console = get_node("Panel/MainHBox/VBoxContainer/Console")
    project_path_browse_window  = get_node("ProjectBrowseWindow")
    project_path_browse_alert  = get_node("ProjectBrowseAlert")
    update_stt_version_label()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


func set_project_path(project_path : String) -> void:
    path_input.text = project_path

func start_project_path_browse() -> void:
    project_path_browse_window.popup_centered()
    

# callback for selecting a directory
func project_path_browse_callback(dir : String) -> void:
    # re-checking if directory exists
    if !DirAccess.dir_exists_absolute(dir):
        display_project_path_error(tr("Error opening directory."))
        return
    var found_version = Context.set_project_path(dir)
    if found_version == 0:
        display_project_path_error(tr("The version couldn't be determined. Is the repository checked out in full?"))
        return
    # everything seems fine?
    path_input.text = dir
    update_stt_version_label()
    Context.project_reloaded.emit()
   
func display_project_path_error(message : String):
    project_path_browse_alert.dialog_text = message
    project_path_browse_alert.popup_centered() 

func update_stt_version_label():
    var version = Context.get_project_version()
    if version > 0:
        set_project_path(Context.get_project_path())
        if version == 1:
            status_version_label.text = tr("Loaded correctly, version 1.x")
        else:
            if version == 2:
                status_version_label.text = tr("Loaded correctly, version 2.x")
    else:
        status_version_label.text = tr("Project not loaded. Select the root of the Git repo")

func start_sync_java():
    JavaHelper.start_copy(console)

func start_strips_generation():
    FontHelper.generate_strips(console)

func start_json_checks():
    LocalesHelper.check_jsons(console)
