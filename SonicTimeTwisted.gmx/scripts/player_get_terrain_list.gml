// player_get_terrain_list()
var x1, y1, x2, y2;

// reset local list
ds_list_clear(terrain_list);

// setup collision rect (ignore decimals)
x1 = floor(x)-offset_y*2;
y1 = floor(y)-offset_y*2;
x2 = floor(x)+offset_y*2;
y2 = floor(y)+offset_y*2;

// evaluate
with objSolid
{
    // continue if not current terrain and on different layers
    if (id!=other.terrain_id) and not (layer&other.layer) continue;

    // check collision rect
    if not collision_rectangle(x1, y1, x2, y2, id, true, false) continue;

    // add solid to list
    ds_list_add(other.terrain_list, id);
}
