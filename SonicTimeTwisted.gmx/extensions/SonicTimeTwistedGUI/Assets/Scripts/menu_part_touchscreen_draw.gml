menu_fn_draw_default();
if(state == 17)
{
    var radius = menu_fn_get_touchscreen_bt_radius();
    draw_set_alpha(objProgram.inputManager.vkalpha);
    draw_sprite(menu_fn_get_touchscreen_dpad_sprite(), 0, 
       16,
       view_hview[view_current] - 16 - 2*radius,
    );
    draw_sprite(menu_fn_get_touchscreen_bt_sprite(), 0, 
       view_wview[view_current] - 16 - 2*radius,
       view_hview[view_current] - 16 - 2*radius,
    );
    draw_set_alpha(1);
}
