draw_set_alpha(0.25);
draw_set_color(c_white);
draw_line_width(argument0, argument1, argument0+282, argument1, 4);
draw_set_alpha(1);

var xmetalprog = 128 + objSSMetalSonic.progress * 280;
if metalProgDisplay > xmetalprog +2{
    metalProgDisplay-=2;
}
else if metalProgDisplay < xmetalprog -2 {
    metalProgDisplay+=2;
}

var xplayerprog = 128 + objSSPlayer.progress * 280;
if playerProgDisplay > xplayerprog +2{
    playerProgDisplay-=2;
}
else if playerProgDisplay < xplayerprog -2{
    playerProgDisplay+=2;
}
draw_sprite_ext(sprRacerIcon, 3, argument0 + objSSMetalSonic.progress * 280, argument1, 1, 1, 0, c_white, 1);
draw_sprite(sprRacerIcon, objGameData.character_id[0]-1, argument0 + objSSPlayer.progress * 280, argument1);
