export const FBaseShader = `uniform float uTime;
uniform sampler2D tex0;
varying vec2 vUv;
varying vec4 vModelPosition;

void main()
{
  vec2 st = vUv.xy/vec2(1.0, 1.0);
  vec3 color = vec3(0.0);
  float d = 0.0;

  // Make the distance field
  d = length( abs(st)-.3 );

  gl_FragColor = vec4(vec3(fract(d*10.0)),0.9);

}`;
