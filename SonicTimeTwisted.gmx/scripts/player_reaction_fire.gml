// player_reaction_fire(local_id)
// flame shield is immune
if shield && shield_type==3 return false;
// get hurt
return player_reaction_harmful(argument0);
