///draw_ffz_orb(scale_multiplier)
draw_sprite_ext(sprFFOrbLarge,image_index,x,y,image_xscale,image_yscale,0,c_white,1);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprFFOrbsLargeAdd,image_index,x,y, image_xscale,image_yscale,0,c_white,.325);
draw_sprite_ext(sprFFOrbLargeEletric,image_index,x,y,image_xscale*argument0,image_yscale*argument0,0,c_white,1);
draw_set_blend_mode(bm_normal);
