var pbOffsetX = argument0;
var pbOffsetY = argument1;
var startOffsetX = argument2;

draw_set_alpha(0.25);
draw_set_color(c_white);
draw_line_width(pbOffsetX, pbOffsetY, pbOffsetX+282, pbOffsetY, 4);
draw_set_alpha(1);

var xmetalprog = startOffsetX + objSSMetalSonic.progress * 280;
if metalProgDisplay > xmetalprog +2{
    metalProgDisplay-=2;
}
else if metalProgDisplay < xmetalprog -2 {
    metalProgDisplay+=2;
}

var xplayerprog = startOffsetX + objSSPlayer.progress * 280;
if playerProgDisplay > xplayerprog +2{
    playerProgDisplay-=2;
}
else if playerProgDisplay < xplayerprog -2{
    playerProgDisplay+=2;
}
draw_sprite_ext(sprRacerIcon, 3, pbOffsetX + objSSMetalSonic.progress * 280, pbOffsetY, 1, 1, 0, c_white, 1);
draw_sprite(sprRacerIcon, objGameData.character_id[0]-1, pbOffsetX + objSSPlayer.progress * 280, pbOffsetY);
