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
    timePostPastSprite = tr_load_localized_sprite('sprPastPost', 6, true, false, 16, 51);
    
    if(sprite_exists(timePostFutureSprite))
    {
         sprite_delete(timePostFutureSprite);
    }
    timePostFutureSprite = tr_load_localized_sprite('sprFuturePost', 6, true, false, 16, 51);
}


