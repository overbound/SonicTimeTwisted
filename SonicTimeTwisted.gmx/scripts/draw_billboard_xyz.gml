/*

void draw_billboard(double xradius, yradius)

*/

draw_set_color(c_white);

d3d_transform_set_rotation_x(objSSCamera.dir2);
d3d_transform_add_rotation_z(objSSCamera.dir1);
d3d_transform_add_translation(argument2, argument3, argument4);

d3d_draw_wall(argument0, 0, argument1, -argument0, 0, -argument1, sprite_get_texture(sprite_index, image_index), 1, 1);

d3d_transform_set_identity();
