export const VBigBloupShader = `
uniform float uTime;
uniform sampler2D tex0;
        varying vec2 vUv;
				varying vec4 vModelPosition;


void main()
{
  vUv = uv;

  vec4 modelPosition = modelMatrix * vec4(position, 1.0);
  // blop petite boule
  modelPosition.x =  modelPosition.x + cos(modelPosition.x * 10.0 + uTime * 0.1) * 0.1;
  // * 0.1
  modelPosition.y =  modelPosition.y + cos(modelPosition.y * 10.0 + uTime * 0.1) * 0.1;
  modelPosition.z =  modelPosition.z + sin(modelPosition.y * 10.0 + uTime * 0.1) * 0.1;

  vec4 viewPosition = viewMatrix * modelPosition;
  vec4 projectedPosition = projectionMatrix * viewPosition;
  
  vModelPosition = modelPosition;

  gl_Position = projectedPosition;
}`;