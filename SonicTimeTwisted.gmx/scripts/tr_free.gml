///tr_free()

ds_map_destroy(global.TR_map);

for (var i = 0; i < 7; i++)
{
    if (sprite_exists(global.TR_sprarr[i]))
    {
        show_debug_message("Freeing spritefont " + string(global.TR_sprarr[i]));
        sprite_delete(global.TR_sprarr[i]);
    }
}
tr_free_localized_sprites();
global.TR_sprarr = 0;
