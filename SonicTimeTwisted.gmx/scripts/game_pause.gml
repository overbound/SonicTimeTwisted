/// game_pause(pause?)
with objScreen { image_speed = not argument0; paused = argument0; }
with objLevel part_system_automatic_update(particles, not argument0);
if not argument0
{
    instance_activate_object(objSceneObject);
    audio_resume_all();
    game_unpause_events();
}
else
{
    with (objScreen)
    {
        if (sprite_exists(screenshot)) sprite_delete(screenshot);
        screenshot = sprite_create_from_surface(application_surface, 0, 0, width, height, 0, 0, 0, 0);
    }
    instance_deactivate_object(objSceneObject);
    audio_pause_all();
}
