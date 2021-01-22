export const VProject5Shader = `
uniform float uTime;
varying float amplitude;
varying float frequency;
varying float x;
varying float y;
varying float z;
varying float t;
uniform sampler2D tex0;
        varying vec2 vUv;
				varying vec4 vModelPosition;


void main()
{
  vUv = uv;
  vec4 modelPosition = modelMatrix * vec4(position, 1.0);
  // blop petite boule

  float amplitude = 1.;
  float frequency = 1.0;
  x = sin(modelPosition.x * frequency);
  float t = uTime * 0.1;
  x += sin(modelPosition.x*frequency*2.1 + t)*4.5;
  x += sin(modelPosition.x*frequency*1.72 + t*1.121)*.0;
  x += sin(modelPosition.x*frequency*2.221 + t*0.437)*5.0;
  x += sin(modelPosition.x*frequency*3.1122+ t*4.269)*2.5;
  x *= amplitude*0.06;

  y = sin(modelPosition.y * frequency);
  y += sin(modelPosition.y*frequency*10.1 + t)*4.5;
  y += sin(modelPosition.y*frequency*1.72 + t*1.121)*4.0;
  y += sin(modelPosition.y*frequency*0.221 + t*0.437)*1.0;
  y += sin(modelPosition.y*frequency*3.1122+ t*4.269)*2.5;
  y *= amplitude*0.06;

  z = cos(modelPosition.z * frequency);
  z += sin(modelPosition.z*frequency*2.1 + t)*4.5;
  z += sin(modelPosition.z*frequency*1.72 + t*1.121)*4.0;
  z += cos(modelPosition.z*frequency*2.221 + t*0.437)*5.0;
  z += sin(modelPosition.z*frequency*3.1122+ t*4.269)*2.5;
  z *= amplitude*0.06;

  modelPosition.x =  modelPosition.x + x * modelPosition.x ;
  modelPosition.y =  modelPosition.y + y  * modelPosition.y;
  modelPosition.z =  modelPosition.z + z * modelPosition.z;
  // modelPosition.x =  modelPosition.x * 0.5 -  cos(modelPosition.x * 10.0 + uTime * 0.1) * 0.1 ;
  // modelPosition.y =  modelPosition.y * 0.5 - cos(modelPosition.y * 10.0 + uTime * 0.1) * 0.1;

  vec4 viewPosition = viewMatrix * modelPosition;
  vec4 projectedPosition = projectionMatrix * viewPosition;
  
  vModelPosition = modelPosition;

  gl_Position = projectedPosition;
}`;