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
        screenshot = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false, false, 0, 0);
    }
    instance_deactivate_object(objSceneObject);
    audio_pause_all();
}
if (argument0) {
    with (objInput) {
        analog_enabled = false;
    }
}

