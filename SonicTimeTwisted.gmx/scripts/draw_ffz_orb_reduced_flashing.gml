///draw_ffz_orb(scale_multiplier)
// we know sprFFOrbLarge and sprFFOrbsLargeAdd have 9 images each

draw_sprite_ext(sprFFOrbLarge,orb_flashing_image_index,x,y,image_xscale,image_yscale,0,c_white,1 - orb_flashing_alpha);
draw_sprite_ext(sprFFOrbLarge,orb_flashing_next_image_index,x,y,image_xscale,image_yscale,0,c_white,orb_flashing_alpha);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprFFOrbsLargeAdd,orb_flashing_image_index,x,y, image_xscale,image_yscale,0,c_white,.325);
//draw_sprite_ext(sprFFOrbsLargeAdd,orb_flashing_next_image_index,x,y, image_xscale,image_yscale,0,c_white,.325 * orb_flashing_alpha);
draw_sprite_ext(sprFFOrbLargeEletric,image_index,x,y,image_xscale*argument0,image_yscale*argument0,0,c_white,1);
draw_set_blend_mode(bm_normal);
