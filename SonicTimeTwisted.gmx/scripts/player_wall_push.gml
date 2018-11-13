// player_wall_push(local_id, direction)

// animate
animation_new = "push";
timeline_speed = 1;

// abort if solid is not movable or is falling
if not argument0.pushable or (argument0.y-argument0.yprevious!=0) return false;
// abort if solid is against a wall
with argument0 if place_meeting(x+cosine[other.angle]*argument1, y-sine[other.angle]*argument1, objSolid) return false;
// push solid
argument0.x += cosine[angle]*argument1;
argument0.y -= sine[angle]*argument1;
// adjust player
x += cosine[angle]*argument1;
y -= sine[angle]*argument1;
