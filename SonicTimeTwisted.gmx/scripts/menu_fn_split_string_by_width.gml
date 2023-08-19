/// menu_fn_split_string_by_width(text, max_width)
// the font must be preset beforehand

if(string_width(argument0) <= argument1) {
    return argument0;
}

var text = argument0;

if (string_pos("#", text) > 0) {    
    var result = "";
    while (string_length(text) > 0) {
        
        if (string_length(result) > 0) {
            result = result + "#";
        }
        if (string_pos("#", text) > 0) {
            result = result + menu_fn_split_string_by_width(string_copy(text, 0, string_pos("#", text) - 1), argument1);
            text = string_copy(text, string_pos("#", text) + 1, string_length(text) - string_pos("#", text));
        } else {
            result = result + menu_fn_split_string_by_width(text, argument1);
            text = "";
        }
        
    }
    return result;
}


if (string_pos(" ", text) > 0) { 
    var result = "";
    var word;
    while (string_length(text) > 0) {
        if (string_pos(" ", text) > 0) {
            word = string_copy(text, 0, string_pos(" ", text) - 1);
            text = string_copy(text, string_pos(" ", text) + 1, string_length(text) - string_pos(" ", text));
        } else {
            word = text;
            text = "";
        }
        
        if (string_width(result + " " + word) > argument1) {
            result = result + "#" + word;
        } else {
            if (string_length(result) > 0) {
                result = result + " " + word;
            } else {
                result = word;
            }
            
        }

    }
    return result;
}
