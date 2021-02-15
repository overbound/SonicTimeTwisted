
// 'unpause' the level but not quite.
reset_temp_values();
objProgram.paused = false;
objScreen.paused = false;
objScreen.image_speed = 1;

transition_to(objFadeWhiteFromSaveToTitle, titlescreen, 24);
print_mem_usage();
instance_destroy();
