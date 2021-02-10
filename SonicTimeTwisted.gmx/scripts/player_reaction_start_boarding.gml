//player_reaction_start_boarding(local_id)
if argument0.visible == 0
exit;
if state == player_state_fly {
    player_is_falling();
}
if state == player_state_glide {
    player_is_falling();
}
with argument0 
{
    visible = 0;
    alarm[0]=40;
    }
// animate
animation_new = "boarding";
timeline_speed = 1;
// rumble
rumble(rumble_short_weak);
