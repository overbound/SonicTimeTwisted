// player_react_set_plane_bottom_boundry (local_id)

if instance_exists(objPlaneGimmick) {

    var plane = instance_nearest(x,y,objPlaneGimmick);
    
    if plane.active == true {
    
        camera.bottom=argument0.bbox_bottom;
    
    }

} else camera.bottom = room_height;
