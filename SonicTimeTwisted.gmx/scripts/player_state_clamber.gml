// player_state_clamber()

// adjust position
switch timeline_position
{
case 8:
    x += (cosine[angle]*8*facing)-(sine[angle]*10);
    y += (-sine[angle]*8*facing)-(cosine[angle]*10);
    break;
case 14:
    x += (-sine[angle]*12);
    y += (-cosine[angle]*12);
    break;
case 20:
    return player_is_standing();
    break;
}
