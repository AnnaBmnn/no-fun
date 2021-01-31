export const VProject8Shader = `
uniform float uTime;
uniform sampler2D tex0;
        varying vec2 vUv;
				varying vec4 vModelPosition;


void main()
{
  vUv = uv;
  vec4 modelPosition = modelMatrix * vec4(position, 1.0);
  // blop petite boule

  modelPosition.z =  modelPosition.y * 0.5 ;
  modelPosition.x =  modelPosition.x * 0.5;
  modelPosition.y =  modelPosition.y * 0.5;
  modelPosition.x = modelPosition.x +  normalize(modelPosition.x) * abs(sin( uTime * 0.05) * cos( uTime * 0.05));
  modelPosition.z = modelPosition.z +  normalize(modelPosition.z) * abs(cos( uTime * 0.05) * sin( uTime * 0.05));
  modelPosition.y = modelPosition.y +  normalize(modelPosition.y) * abs(cos( uTime * 0.05) * sin( uTime * 0.05));

  vec4 viewPosition = viewMatrix * modelPosition;
  vec4 projectedPosition = projectionMatrix * viewPosition;
  
  vModelPosition = modelPosition;

  gl_Position = projectedPosition;
}`;