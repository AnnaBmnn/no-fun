export const VProject4Shader = `
uniform float uTime;
uniform sampler2D tex0;
        varying vec2 vUv;
				varying vec4 vModelPosition;


void main()
{
  vUv = uv;
  vec4 modelPosition = modelMatrix * vec4(position, 1.0);
  // blop petite boule

  modelPosition.z =  modelPosition.z * 0.5 + cos(modelPosition.z + uTime * 0.1) * 0.8;
  modelPosition.x =  modelPosition.x * 0.5  + cos(modelPosition.z * 5.0 + uTime * 0.01) * 0.8 + modelPosition.z * 0.5;
  modelPosition.y =  modelPosition.y * 0.5 + sin(modelPosition.z * 5.0 + uTime * 0.2) * 0.8;

  vec4 viewPosition = viewMatrix * modelPosition;
  vec4 projectedPosition = projectionMatrix * viewPosition;
  
  vModelPosition = modelPosition;

  gl_Position = projectedPosition;
}`;