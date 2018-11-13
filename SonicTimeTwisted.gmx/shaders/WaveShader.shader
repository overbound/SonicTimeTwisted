attribute vec3 in_Position;
attribute vec2 in_TextureCoord;
varying vec2 v_texcoord;
void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
    v_texcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_texcoord;
uniform float time;
uniform vec2 mouse_pos;
uniform vec2 resolution;
uniform float wave_amount;
uniform float wave_distortion;
uniform float wave_speed;
void main()
{ 
    vec2 uv = v_texcoord;
    uv.x = uv.x+cos(uv.y*wave_amount+time*wave_speed)/wave_distortion;
    uv.y = uv.y+sin(uv.x*wave_amount+time*wave_speed)/wave_distortion;
 
    gl_FragColor = texture2D(gm_BaseTexture,uv);
}
