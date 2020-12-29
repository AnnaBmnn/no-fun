export const FBaseVideoShader = `uniform float uTime;
uniform sampler2D tex0;
varying vec2 vUv;
varying vec4 vModelPosition;

void main()
{
  vec2 pos = vUv;
  vec4 cam = texture2D(tex0,pos);
  gl_FragColor = cam;
}`;
