// player_state_hurt()

// update position
if not player_movement_air() {invulnerable = 120; return false;}

// gravity
yspeed += hit_force;

// landing
if landed
{
    // start running
    player_is_standing();

    // freeze movement
    xspeed = 0;
    yspeed = 0;

    // gain temporary invulnerability
    invulnerable = 120;
}
