export const VProject3Shader = `
uniform float uTime;
uniform sampler2D tex0;
        varying vec2 vUv;
				varying vec4 vModelPosition;


void main()
{
  vUv = uv;
  vec4 modelPosition = modelMatrix * vec4(position, 1.0);
  // blop petite boule

  modelPosition.z =  modelPosition.z + cos(modelPosition.z * 1.0 + uTime * 0.1) * 0.1;
  // * 0.1
  modelPosition.x =  modelPosition.x + cos(modelPosition.z * 10.0 + uTime * 0.01) * 0.1;
  modelPosition.y =  modelPosition.y + sin(modelPosition.z * 10.0 + uTime * 0.1) * 1.1;

  vec4 viewPosition = viewMatrix * modelPosition;
  vec4 projectedPosition = projectionMatrix * viewPosition;
  
  vModelPosition = modelPosition;

  gl_Position = projectedPosition;
}`;