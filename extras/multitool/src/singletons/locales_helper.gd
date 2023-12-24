extends "res://singletons/abstract_helper.gd"

var locales_data : Dictionary
var string_to_add : String

func _ready():
    super()
    string_to_add = ""
    locales_data = Dictionary()

func check_jsons(console_node : TextEdit):
    init_console(console_node)
    var locales = get_locales_list()
    var english_data = get_parsed_json_if_exists(get_project_datafiles_dir()+"/translations/English.json")
    if !english_data:
        log_to_console(tr("Invalid JSON: ")+"English.json")
        return
    for locale in locales:
        # English is used as reference, skip it
        if locale == "English":
            continue
        if validate_locale_state(locale, english_data):
            log_to_console(tr("%1 locale OK!").replace("%1", locale))
        else:
            log_to_console(tr("%1 locale not validated. See details above.").replace("%1", locale))
        log_to_console("")

func validate_locale_state(locale : String, english_data : Dictionary) -> bool:
    var messages = PackedStringArray()
    var filename = get_project_datafiles_dir()+"/translations/"+locale
    if !FileAccess.file_exists(filename+".json"):
        log_to_console(tr("File does not exist: ")+filename+".json")
        return false
        
    var localized_data = get_parsed_json_if_exists(filename+".json")
    if !localized_data:
        log_to_console(tr("Invalid JSON: ")+locale+".json")
        return false

    log_to_console(tr("Checking JSON for locale %1").replace("%1", locale)+".json")
    return find_missing_locale_keys(english_data, localized_data)

func find_missing_locale_keys(english_data : Dictionary, localized_data : Dictionary) -> bool:
    var sections = ["info", "data"]
    var message_buffer = ""
    
    for section in sections:
        var prefix = tr("Add this to the section \"$1\":").replace("$1", section)
        var prefix_used = false
        for key in english_data[section]:
            if !(localized_data.has(section) && localized_data[section].has(key)):
                if !prefix_used:
                    message_buffer = prefix
                    prefix_used = true
                message_buffer = message_buffer + "\n\t\""+key+"\": \""+english_data[section][key].replace("\"", "\"\"")+"\""

    if message_buffer.length() > 0:
        log_to_console(message_buffer)
        return false
    return true
    
