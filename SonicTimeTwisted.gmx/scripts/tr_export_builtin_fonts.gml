///tr_export_builtin_fonts()

var _start = sprFontHud;
var _end = sprFontMicro;

var _sep = get_path_sep();
if (!directory_exists("Export")) directory_create("Export");

for (var i = _start; i <= _end; i++) {
    var _width = sprite_get_width(i);
    var _height = sprite_get_height(i);
    var _frames = sprite_get_number(i);
    
    var _fname = "Export" + _sep + sprite_get_name(i) + "_strip" + string(_frames) + ".png";
    show_debug_message("Writing file " + _fname);
    file_delete(_fname); // delete the file if it exists.
    
    // for some reason sprite_save[_strip] is broken, so I do some surface magic instead.
    // thanks YoYoGames for breaking the function!
    var _surf = surface_create(_width * _frames, _height);
    surface_set_target(_surf);
    
    draw_clear_alpha(c_black, 0);
    // this function ignores the sprite's x/y offset, which is what we need.
    for (var j = 0; j < _frames; j++)
        draw_sprite_stretched(i, j, j * _width, 0, _width, _height);
        
    surface_reset_target();
    
    surface_save(_surf, _fname);
    surface_free(_surf);
    // we're done here, free the surface.
}
