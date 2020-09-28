//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform sampler2D mask;
uniform sampler2D grad;
uniform float shift;
uniform vec2 scl;
void main()
{
    vec4 maskPixel = texture2D( mask, vec2(
        mod(v_vTexcoord.x * scl.x + shift, 1.0),
        mod(v_vTexcoord.y * scl.y, 1.0)
    ) );
    maskPixel = texture2D( grad, vec2(mod(maskPixel.r + shift, 1.0), 0.0) );
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord ) * maskPixel;
}
