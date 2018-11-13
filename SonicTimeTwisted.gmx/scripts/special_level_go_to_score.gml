// special_level_go_to_score()
// save score in global object
if(object_exists(objSSLevel) && object_exists(objSSPlayer))
{
    if (objSSLevel.total_rings == 0)
        objProgram.ss_perfect_bonus = 50000;
    else
        objProgram.ss_perfect_bonus = -1;
    objProgram.ss_rings_bonus = objSSPlayer.rings*10;
    
    var time_bonus; 
    var total_time = objSSLevel.timer div 60;
    if total_time > 570 time_bonus = 50000; else
    if total_time > 555 time_bonus = 10000; else
    if total_time > 540 time_bonus = 5000; else
    if total_time > 510 time_bonus = 4000; else
    if total_time > 480 time_bonus = 3000; else
    if total_time > 420 time_bonus = 2000; else
    if total_time > 360 time_bonus = 1000; else
    if total_time > 300 time_bonus = 500; else
    time_bonus = 0;
    objProgram.ss_time_bonus = time_bonus;
}
// transition
transition_to(objSSToScore, ss_results_screen, 20);
