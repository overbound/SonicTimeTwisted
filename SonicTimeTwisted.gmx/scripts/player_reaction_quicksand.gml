// player_reaction_quicksand(local_id)

// ignore if already standing on something
if not (landed&3) and yspeed>=0
{
    // confirm sinking
    landed |= 4;

    // fall based on force
    x += sine[relative_angle]*argument0.force;
    y += cosine[relative_angle]*argument0.force;
}

// not a hard collision
return false;
