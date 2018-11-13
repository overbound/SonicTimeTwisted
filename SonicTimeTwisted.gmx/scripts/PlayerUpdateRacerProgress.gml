/*
void PlayerUpdateRaceProgress()
*/
var p;
if (z < 0) exit;
//p = getProg(progmap, floor(x div 64), 128 - floor(y div 64));
p = getProg(objSSCamera.progGrid, x div 64, 128 - (y div 64));
if (p != -1) progress = 1 - p;
