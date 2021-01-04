///game_unpause_events()

// Used to trigger events on game unpause
// They include updating and items that depend on localization or flashing configurations

// Past/Future signposts - localizeable sprites
with(objTimePost)
{
    event_user(0);
}
// HUD - Score/Rings/Time offset
with(objHud)
{
    event_user(0);
}
with(objSSHud)
{
    event_user(0);
}
// FFZ orbs - flashing
with(objFFOrb)
{
    event_user(0);
}
with(objFFOrbLarge)
{
    event_user(0);
}

