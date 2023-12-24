extends "res://singletons/abstract_helper.gd"

var fonts_data : Dictionary
var locales_data : Dictionary

class FontData:
    var height: int
    var width: int
    var space_pixels: bool
    var contour_enabled: bool
    var contour_rounded: bool
    var contour_shadow: bool
    var letters: Dictionary

func _ready():
    super()
    fonts_data = Dictionary()
    locales_data = Dictionary()

func generate_strips(console_node : TextEdit):
    init_console(console_node)
    fonts_data.clear()
    locales_data.clear()
    var fonts_data = get_parsed_json_if_exists(get_project_tools_dir()+"/fonts/fonts/fonts.json")
    var output_directory = get_project_datafiles_dir()+"/translations"
    if !fonts_data:
        log_to_console(tr("Invalid JSON: ")+get_project_tools_dir()+"/fonts/fonts/fonts.json")
        return
    if !load_fonts_data():
        return
    load_locales_data()
    save_strips(output_directory)
    

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

func load_fonts_data() -> bool:
    log_to_console(tr("Fetching font settings"))
    fonts_data.clear()
    var result = Dictionary()
    print(get_project_extensions_dir()+"/fonts/fonts/fonts.json")
    var fonts_json_data = get_parsed_json_if_exists(get_project_tools_dir()+"/fonts/fonts/fonts.json")
    if !fonts_json_data:
        log_to_console(tr("Could not open font configuration file"))
        return false
    for font_name in fonts_json_data["fonts"]:
        var font_data = FontData.new()
        font_data.height = int(fonts_json_data["fonts"][font_name]["height"])
        font_data.width = int(fonts_json_data["fonts"][font_name]["width"])
        font_data.space_pixels = fonts_json_data["fonts"][font_name]["space_pixels"] == "true"
        font_data.contour_enabled = fonts_json_data["fonts"][font_name]["contour"]["enabled"] == "true"
        font_data.contour_rounded = fonts_json_data["fonts"][font_name]["contour"]["rounded"] == "true"
        font_data.contour_shadow = fonts_json_data["fonts"][font_name]["contour"]["shadow"] == "true"
        font_data.letters = Dictionary()
        
        add_letters_from_file(get_project_tools_dir()+"/fonts/fonts/"+font_name+".png", fonts_json_data["base_sequence"], font_data.letters, font_data.height, font_data.width)
        for extension_name in fonts_json_data["extensions"]:
            add_letters_from_file(get_project_tools_dir()+"/fonts/fonts/extensions/"+font_name+"."+extension_name+".png", fonts_json_data["extensions"][extension_name], font_data.letters, font_data.height, font_data.width)
        var font_filename = "spr"+font_name.substr(0, 1).to_upper()+font_name.substr(1)
        result[font_filename] = font_data
    fonts_data = result
    return true

func load_locales_data() -> void:
    log_to_console(tr("Fetching locale settings"))
    locales_data.clear()
    var result = Dictionary()
    var locales = get_locales_list()
    for locale in locales:
        var locale_data = get_parsed_json_if_exists(get_project_datafiles_dir()+"/translations/"+locale+".json")
        if locale_data:
            var valid = true
            var strings = Dictionary()
            for font_filename in fonts_data:
                if locale_data["info"]["font_param"].has(font_filename):
                    strings[font_filename] = locale_data["info"]["font_param"][font_filename]["alphabet"]
            result[locale] = strings
            log_to_console(tr(" - %1 - OK").replace("%1", locale))
        else:
            log_to_console(tr(" - %1 - not loaded, check JSON for validity").replace("%1", locale))

    locales_data = result

func add_letters_from_file(path : String, sequence : String, dest : Dictionary, h : int, w : int):
    if !FileAccess.file_exists(path):
        log_to_console(tr(" - File does not exist %1").replace("%1", path))
        log_to_console(tr(" - Make sure this is intentional").replace("%1", path))
        return
    var image_data = Image.new()
    image_data.load(path)
    var letters_per_row : int = floor(image_data.get_width()/w)
    var rows_count : int = floor(image_data.get_height()/h)
    var total_letters_in_file = letters_per_row * rows_count
    var i = 0
    
    var image_bits : PackedByteArray
    var offset_left : int
    var offset_top : int
    var x : int
    var y : int
    while i < sequence.length() && i < total_letters_in_file:
        image_bits = PackedByteArray()
        offset_left = (i % letters_per_row) * w
        offset_top = floor(i/letters_per_row) * h
        
        y = 0
        while y < h:
            x = 0
            while x < w:
                image_bits.append(is_color_black(image_data.get_pixel(x + offset_left, y + offset_top)))
                x = x + 1
            y = y + 1
        #print_letter_data(sequence.substr(i, 1), image_bits, w)
        dest[sequence.substr(i, 1)] = image_bits
        i = i + 1

func is_color_black(c : Color) -> bool:
    return c.r8 < 10 && c.g8 < 10 && c.b8 < 10 && c.a8 > 240

func print_letter_data(letter : String, bits : PackedByteArray, w : int):
    print("LETTER: "+letter+"\n\n")
    var i = 0
    var c = 0
    var buffer := ""
    while i < bits.size():
        if bits[i]:
            buffer = buffer + "#"
        else:
            buffer = buffer + "."
        i = i + 1
        c = c + 1
        if c >= w:
            c = 0
            buffer = buffer + "\n"
    buffer = buffer + "\n\n\n"
    print(buffer)

func save_strips(base_output_directory : String):
    for locale_name in locales_data:
        var output_directory = base_output_directory+"/"+locale_name
        if !DirAccess.dir_exists_absolute(output_directory):
            DirAccess.make_dir_recursive_absolute(output_directory)
        for font_filename in fonts_data:
            var font_data : FontData = fonts_data[font_filename]
            if locales_data[locale_name].has(font_filename):
                var letters : String = locales_data[locale_name][font_filename]
                var image = Image.create(font_data.width * letters.length(), font_data.height, false, Image.FORMAT_RGBA8)
                image.fill(Color(0, 0, 0, 0))
                var i := 0
                while i < letters.length():
                    var char = letters.substr(i, 1)
                    var char_pixels : PackedByteArray
                    var char_pixels_count = font_data.width * font_data.height
                    var j : int
                    if font_data.letters.has(char):
                        char_pixels = font_data.letters[char]
                    else:
                        char_pixels = PackedByteArray()
                        j = 0
                        while j < char_pixels_count:
                            char_pixels.append(0)
                            j = j + 1
                    
                    var x = 0
                    var y = 0
                    var offset = i * font_data.width
                    # first, draw space pixels for non-monospaced fonts
                    if char == " " && font_data.space_pixels:
                        image.set_pixel(offset, 0, Color(1, 1, 1, 0.004))
                        image.set_pixel(offset + font_data.width - 1, font_data.height - 1, Color(1, 1, 1, 0.004))
                        
                    j = 0
                    while j < char_pixels_count:
                        x = (j % font_data.width) + offset
                        y = floor(j / font_data.width)
                        if char_pixels[j]:
                           image.set_pixel(x, y, Color(1, 1, 1, 1))
                        j = j + 1
                        
                    # apply contour or shadow
                    if font_data.contour_enabled:
                        var up_applies : bool
                        var down_applies : bool
                        var left_applies : bool
                        var right_applies : bool
                        var up_shadow_applies : bool
                        var left_shadow_applies : bool
                        var down_shadow_applies : bool
                        var right_shadow_applies : bool
                        j = 0
                        while j < char_pixels_count:
                            x = (j % font_data.width) + offset
                            y = floor(j / font_data.width)
                            if char_pixels[j]:
                                #check if pixel at a border
                                up_applies = (j >= font_data.width)
                                down_applies = (j + font_data.width) < char_pixels_count
                                left_applies = floor(j / font_data.width) == floor((j - 1) / font_data.width)
                                right_applies = floor(j / font_data.width) == floor((j + 1) / font_data.width)
                                if font_data.contour_shadow:
                                    up_shadow_applies = right_applies
                                    left_shadow_applies = down_applies
                                    down_shadow_applies = (j + (2*font_data.width)) < char_pixels_count
                                    right_shadow_applies = down_applies && floor(j / font_data.width) == floor((j + 2) / font_data.width)
                                else:
                                    up_shadow_applies = false
                                    left_shadow_applies = false
                                    down_shadow_applies = false
                                    right_shadow_applies = false
                                
                                # up, left - fill if full contour enabled
                                if up_applies && !char_pixels[j-font_data.width]:
                                    image.set_pixel(x, y-1, Color(0, 0, 0, 1))
                                    if font_data.contour_shadow && up_shadow_applies && !char_pixels[j+1]:
                                        image.set_pixel(x+1, y, Color(0, 0, 0, 1))
                                    
                                if left_applies && !char_pixels[j-1]:
                                    image.set_pixel(x-1, y, Color(0, 0, 0, 1))
                                    if font_data.contour_shadow && left_shadow_applies && !char_pixels[j+font_data.width]:
                                        image.set_pixel(x, y+1, Color(0, 0, 0, 1))
                                    
                                # up-left, up-right, down-left - fill if rounded is off
                                if (!font_data.contour_rounded):
                                    if up_applies && left_applies && !char_pixels[j-font_data.width-1]:
                                        image.set_pixel(x-1, y-1, Color(0, 0, 0, 1))
                                        # no shadow, it would take the pixel itself
                                    if up_applies && right_applies && !char_pixels[j-font_data.width+1]:
                                        image.set_pixel(x+1, y-1, Color(0, 0, 0, 1))
                                        if font_data.contour_shadow && up_shadow_applies && right_shadow_applies && !char_pixels[j+2]:
                                            image.set_pixel(x+2, y, Color(0, 0, 0, 1))
                                    if down_applies && left_applies && !char_pixels[j+font_data.width-1]:
                                        image.set_pixel(x-1, y+1, Color(0, 0, 0, 1))
                                        if font_data.contour_shadow && down_shadow_applies && left_shadow_applies && !char_pixels[j+(font_data.width*2)]:
                                            image.set_pixel(x, y+2, Color(0, 0, 0, 1))
                                
                                # down, right - always fill
                                if down_applies && !char_pixels[j+font_data.width]:
                                    image.set_pixel(x, y+1, Color(0, 0, 0, 1))
                                    if font_data.contour_shadow && down_shadow_applies && !char_pixels[j+(font_data.width*2)+1]:
                                        image.set_pixel(x+1, y+2, Color(0, 0, 0, 1))
                                if right_applies && !char_pixels[j+1]:
                                    image.set_pixel(x+1, y, Color(0, 0, 0, 1))
                                    if font_data.contour_shadow && right_shadow_applies && !char_pixels[j+font_data.width+2]:
                                        image.set_pixel(x+2, y+1, Color(0, 0, 0, 1))
                                    
                                # down-right - fill if rounded is off 
                                if (!font_data.contour_rounded):
                                    if down_applies && right_applies && !char_pixels[j+font_data.width+1]:
                                        image.set_pixel(x+1, y+1, Color(0, 0, 0, 1))
                                        if font_data.contour_shadow && down_shadow_applies && right_shadow_applies && !char_pixels[j+(2*font_data.width)+2]:
                                            image.set_pixel(x+2, y+2, Color(0, 0, 0, 1))
                            j = j + 1
                    else:
                        if font_data.contour_shadow:
                            var down_applies : bool
                            var right_applies : bool
                            j = 0
                            while j < char_pixels_count:
                                x = (j % font_data.width) + offset
                                y = floor(j / font_data.width)
                                if char_pixels[j]:
                                    #check if pixel at a border
                                    down_applies = (j + font_data.width) < char_pixels_count
                                    right_applies = floor(j / font_data.width) == floor((j + 1) / font_data.width)

                                    # down, right - always fill
                                    if down_applies && !char_pixels[j+font_data.width]:
                                        image.set_pixel(x, y+1, Color(0, 0, 0, 1))
                                    if right_applies && !char_pixels[j+1]:
                                        image.set_pixel(x+1, y, Color(0, 0, 0, 1))
                                        
                                    # down-right - fill if rounded is off 
                                    if (!font_data.contour_rounded):
                                        if down_applies && right_applies && !char_pixels[j+font_data.width+1]:
                                            image.set_pixel(x+1, y+1, Color(0, 0, 0, 1))
                                j = j + 1
                    i = i + 1
                
                var err = image.save_png(output_directory+"/"+font_filename+".png")
                if err == OK:
                    log_to_console(tr("File saved: "+output_directory+"/"+font_filename+".png"))
                else:
                    log_to_console(tr("Could not save file: "+output_directory+"/"+font_filename+".png"))
                
