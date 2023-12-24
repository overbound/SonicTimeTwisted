extends "res://singletons/abstract_helper.gd"

var json : JSON = JSON.new()
var string_to_add : String

func _ready():
    super()
    string_to_add = ""
    json = JSON.new()

func validate_locale_state(locale : String) -> PackedStringArray:
    var messages = PackedStringArray()
    var filename = get_project_datafiles_dir()+"/translations/"+locale
    if !FileAccess.file_exists(filename+".json"):
        messages.append(tr("File does not exist: ")+filename+".json")
        return messages
    var english_data = json.parse_string(FileAccess.get_file_as_string(get_project_datafiles_dir()+"/translations/English.json"))
    if !english_data:
        messages.append(tr("Invalid JSON: ")+"English.json")
        
    var localized_data = json.parse_string(FileAccess.get_file_as_string(get_project_datafiles_dir()+"/translations/"+locale+".json"))
    if !localized_data:
        messages.append(tr("Invalid JSON: ")+locale+".json")

    if (messages.size()):
        return messages
                
    return messages

func get_missing_locale_keys(english_data : Dictionary, localized_data : Dictionary) -> PackedStringArray:
    var result = []
    var sections = ["info", "data"]
    
    for section in sections:
        var prefix = tr("Add this to the section \"$1\":").replace("$1", section)+"\n"
        var prefix_used = false
        for key in english_data[section]:
            if (!localized_data.has(section) && localized_data[section].has(key)):
                if !prefix_used:
                    string_to_add = string_to_add + prefix
                    prefix_used = true

    
    return result
    
