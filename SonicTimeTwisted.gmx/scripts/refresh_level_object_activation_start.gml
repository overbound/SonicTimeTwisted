do_reactivate = abs(view_xview[view_current] - current_view_x) > view_wview[view_current] || abs(view_yview[view_current] - current_view_y) > view_hview[view_current];
if(do_reactivate)
{
    reactivate_level_objects_start();
}
