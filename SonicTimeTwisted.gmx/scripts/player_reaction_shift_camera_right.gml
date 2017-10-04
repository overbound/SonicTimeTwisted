// player_reaction_shift_camera_right

if camera.right > view_xview+view_hview {

    view_xview+=2;

} 
if room_width < view_xview+view_hview {

    view_xview=room_width-view_hview;
    with argument0 instance_destroy();
    
}
