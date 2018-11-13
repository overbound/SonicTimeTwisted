// player_reaction_board_exit(local_id)
if boarding == true {
instance_create(x,y,objBoardExit);
boarding = false;
}
return false;
