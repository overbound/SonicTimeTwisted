/// player_reaction_rhinobot()

// create enemy
with instance_create(x, y, objRhinobot)
{
    hspeed = -4;
    vspeed = -3;
    gravity = 0.21875;
    state = 2;
    facing = -1;
    layer = 2;
}

// sound
audio_play_sound(sndCollapse, 2, false);

// destroy this
instance_destroy();
