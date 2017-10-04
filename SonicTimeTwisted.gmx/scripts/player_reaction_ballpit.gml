// player_reaction_ballpit(local_id)

// ignore if already standing on something
if not (landed&3) and yspeed>=0
{
    // confirm sinking
    landed |= 4;

    // fall based on force
    x += sine[relative_angle]*argument0.force;
    y += cosine[relative_angle]*argument0.force;
    
    if !argument0.inSand {
       with instance_create(x,y+10,objBallSplash) {
        image_index = random(2)+2;
        speed = 4;
        direction = 105;
        scale = true;
        depth = -10;
       }
       with instance_create(x,y+10,objBallSplash) {
        image_index = random(2);
        speed = 4;
        direction = 75;
        scale = true;
        depth = -10;
       }
       with instance_create(x,y+10,objBallSplash) {
        image_index = random(2);
        speed = 3;
        direction = 120;
       }
       with instance_create(x,y+10,objBallSplash) {
        image_index = random(2)+2;
        speed = 3;
        direction = 60;
       }
    }
    
    argument0.inSand = true;
}

// not a hard collision
return false;
