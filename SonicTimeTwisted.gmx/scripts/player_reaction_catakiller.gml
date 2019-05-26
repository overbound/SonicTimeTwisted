/// player_reaction_catakiller(local_id)
// scatter orbs
with argument0.parent_id
{
    // break free if frozen
    if frozen
    {
        frozen = false;
        alarm[1] = -1;
        // release debris
        with instance_create(x-12, y-8, objShieldIceBlockDebris) {depth = other.depth-1; hspeed = -2; vspeed = -4;}
        with instance_create(x+12, y-8, objShieldIceBlockDebris) {depth = other.depth-1; hspeed = 2; vspeed = -4; image_index = 1;}
        with instance_create(x-12, y+8, objShieldIceBlockDebris) {depth = other.depth-1; hspeed = -2; vspeed = -2; image_index = 2;}
        with instance_create(x+12, y+8, objShieldIceBlockDebris) {depth = other.depth-1; hspeed = 2; vspeed = -2; image_index = 3;}
    }
    // bounce
    if not bouncing alarm[0] = 120;
    bouncing = true;
    gravity = 0.21875;
    speed = 4;
    direction = floor(random(60)+60);
    jump_action = true;
    // bounce orbs, too
    for (i=0; i<3; i+=1)
    {
        with orb[i] {
        speed = 4;
        alarm[0] = 120;
        gravity = 0.21875;
        direction = floor(random(60)+60);
        remove = 2;
        
        }
        orb[i] = noone;
    }
}
// get hurt
if !(abs(xspeed)>=6 && character_id==3){
    return player_reaction_harmful(argument0);
}
