export const VProject7Shader = `
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
  modelPosition.y = modelPosition.y +  normalize(cos(modelPosition.y * 1.0 + uTime * 0.05) * 1.0) * 0.5;
  modelPosition.z = modelPosition.z +  normalize(sin(modelPosition.z* 1.0 + uTime * 0.05) * 1.0) * 0.5;
  modelPosition.x = modelPosition.x +  normalize(modelPosition.x) * 0.5 ;
  // modelPosition.xy = reflect( modelPosition.xy , normalize(modelPosition.xy));

  vec4 viewPosition = viewMatrix * modelPosition;
  vec4 projectedPosition = projectionMatrix * viewPosition;
  
  vModelPosition = modelPosition;

  gl_Position = projectedPosition;
}`;