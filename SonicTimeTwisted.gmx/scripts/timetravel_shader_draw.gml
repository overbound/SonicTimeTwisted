// argument0 - sprite/screen width
// argument1 - sprite/screen height
// argument2 - surface draw x
// argument3 - surface draw y

shader_set(TimeTravelShader);

    // send: the scaling of the sparkly SCD texture so it will repeat enough times to not be stretched
    shader_set_uniform_f(param_scl, argument0 / tt_width, argument1 / tt_height);
    // send: the texture index of the sparkly SCD texture
    texture_set_stage(stage_mask, tt_texhandle);
    // send: the texture index of the the gradient used to cycle the colours
    texture_set_stage(stage_grad, grad_texhandle);
    
    shader_set_uniform_f(param_shift, shift); // send the shift amount (for colour cycling) to the shader
    draw_surface_ext(tt_surface, argument2, argument3, image_xscale, image_yscale, 0, c_white, 1);
shader_reset();
