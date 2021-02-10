///tr_free_localized_sprites()

with(objResources)
{
    if(sprite_exists(timePostPastSprite))
    {
         sprite_delete(timePostPastSprite);
    }
    if(sprite_exists(timePostFutureSprite))
    {
         sprite_delete(timePostFutureSprite);
    }
}


