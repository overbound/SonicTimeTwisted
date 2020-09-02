// argument0 - sprite/screen width
// argument1 - sprite/screen height

/*
TIME TRAVEL EFFECT
This effect is achieved by drawing an animation (in this case, a scaled sprite) to a surface.
This results in a white on transparent image on the surface. When the surface is drawn with the TimeTravelShader applied,
the white pixels will be replaced with a texture that makes it look like the SCD time travel effect.
*/
// send some information to the shader; the shader has to be set for this to work
// (I don't know if this can be screwed up by using other shaders; if so, this info might have to be sent in the draw event...)
shader_set(TimeTravelShader);
// send: the scaling of the sparkly SCD texture so it will repeat enough times to not be stretched
shader_set_uniform_f(shader_get_uniform(TimeTravelShader, "scl"), argument0 / background_get_width(tt_texture), argument1 / background_get_height(tt_texture));
// send: the texture index of the sparkly SCD texture
texture_set_stage(shader_get_sampler_index(TimeTravelShader, "mask"), background_get_texture(tt_texture));
// send: the texture index of the the gradient used to cycle the colours
texture_set_stage(shader_get_sampler_index(TimeTravelShader, "grad"), background_get_texture(tt_gradient));
shader_reset();
// create a surface the size of the screen to draw the effect on
tt_surface = surface_create(426, 240);
// I've included two types of "zipper animation" - see step event
type = false;
// the image index of the animated sprite that will be drawn to the texture
image_index = 0;
image_speed = 0;
// the amount to shift the gradient to cycle the colours; starts at 0
// it's also used to slide the texture horizontally to give it some motion, but you could use a 2nd value
// if the speeds need to be tweaked
shift = 0;
// the parameter handle to be used to send the shift amount to the shader later in the draw event
param_shift = shader_get_uniform(TimeTravelShader, "shift");


// fix by nkrapivin: this applies to some platforms other than the PC, like PS4 and Android
tt_texhandle = background_get_texture(tt_texture);
grad_texhandle = background_get_texture(tt_gradient);
tt_width = background_get_width(tt_texture);
tt_height = background_get_height(tt_texture);

tts_ok = shader_is_compiled(TimeTravelShader);
if (!tts_ok) show_message_async("Could not compile Time Travel Shader!");
param_shift = shader_get_uniform(TimeTravelShader, "shift");
param_scl = shader_get_uniform(TimeTravelShader, "scl");
stage_mask = shader_get_sampler_index(TimeTravelShader, "mask");
stage_grad = shader_get_sampler_index(TimeTravelShader, "grad");
