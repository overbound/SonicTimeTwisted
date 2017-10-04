//player_set_score(score)
with objGameData {
    player_score[0] += argument0;
    if player_score[0] div 50000 == scoreLiveCounter {
        scoreLiveCounter++;
        player_get_lives(1);
    }
}
