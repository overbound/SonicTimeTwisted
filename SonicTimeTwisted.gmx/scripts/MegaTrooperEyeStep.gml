/*
MegaTrooperEye \ ev_step \ ev_step_normal
*/
if instance_exists(objLevel.player[0]) {
    ang = point_direction(objMegaTrooperHead.x, objMegaTrooperHead.y, objLevel.player[0].x, objLevel.player[0].y) * pi / 180;
    dis = min(point_distance(objMegaTrooperHead.x, objMegaTrooperHead.y, objLevel.player[0].x, objLevel.player[0].y) / 8, 8);
}
x = centerx + cos(ang) * dis;
y = centery - sin(ang) * dis;
