var mx = mouse_x;
// handle the cases when integer scaling is used
with(objScreen) {
    if (video_mode > 0) {
        mx = view_xview[0] + (mx - view_xview[0] - width*(1 - (video_mode/full_scale))/2)*(full_scale/video_mode);
    }
}
return mx;
