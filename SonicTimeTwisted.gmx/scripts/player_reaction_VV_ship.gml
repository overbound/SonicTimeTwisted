// player_reaction_VV_ship(local_id)
// trigger
if (!argument0.moving)
{
    with (argument0)
    {
        moving = true;
    }
    if (argument0.door != noone)
    {
        instance_activate_object(argument0.door);
        with (argument0.door) {
            event_user(3);
        }
    }
}
// not a hard collision
return false;
