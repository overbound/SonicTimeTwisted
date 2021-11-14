///tr_load_localized_sprites()

// This will load sprites that can be localized.
// Right now, it only applies to the past/future signposts
// Localizable sprites are optional, if they are absent, default pmes will be used instead

// Past/Future signposts
with(objResources)
{
    if(sprite_exists(timePostPastSprite))
    {
         sprite_delete(timePostPastSprite);
    }
    timePostPastSprite = tr_load_localized_sprite(sprite_get_name(sprPastPost), sprite_get_number(sprPastPost), false, false, sprite_get_xoffset(sprPastPost), sprite_get_yoffset(sprPastPost));
    
    if(sprite_exists(timePostFutureSprite))
    {
         sprite_delete(timePostFutureSprite);
    }
    timePostFutureSprite = tr_load_localized_sprite(sprite_get_name(sprFuturePost), sprite_get_number(sprFuturePost), false, false, sprite_get_xoffset(sprFuturePost), sprite_get_yoffset(sprFuturePost));
}


