<template>
  <div>
    <canvas id="canvas" class="canvas"></canvas>
    <video ref="video"></video>
  </div>
</template>

<script>
import * as THREE from "three";
// import { GLTFLoader } from "three/examples/jsm/loaders/GLTFLoader";
import OrbitControls from "three-orbitcontrols";

export default {
  name: "ThreeJSContainer",
  data() {
    return {
      camera: null,
      controls: null,
      scene: null,
      renderer: null,
      geometry: null,
      texture: null,
      shaderMaterial: null,
      mesh: null,
      hlight: null,
      light: null,
      ligh2: null,
      time: 0,
      webcam: null,
      videoDomElement: null,
    };
  },
  methods: {
    init() {
      // let loader = new GLTFLoader();

      // Scene
      this.scene = new THREE.Scene();
      // this.scene.background = new THREE.Color(0xdddddd);

      // Camera
      this.camera = new THREE.PerspectiveCamera(75, 1, 0.1, 1000);
      this.camera.position.z = 5;

      // Lights

      // Rendering
      this.renderer = new THREE.WebGLRenderer({
        canvas: document.getElementById("canvas"),
        antialias: true,
        alpha: true,
      });
      this.renderer.setClearColor(0xffffff, 0);
      this.renderer.setPixelRatio(window.devicePixelRatio);
      this.renderer.setSize(window.innerHeight * 0.8, window.innerHeight * 0.8);

      // Loading model
      // loader.load(
      //   "https://s3-us-west-2.amazonaws.com/s.cdpn.io/39255/ladybug.gltf",
      //   // We need to use arrow functions otherwise "this" refers to loader and not the Vue instance
      //   (gltf) => {
      //     // this.scene.add(gltf.scene);

      //     // gltf.animations; // Array<THREE.AnimationClip>
      //     // gltf.scene; // THREE.Scene
      //     // gltf.scenes; // Array<THREE.Scene>
      //     // gltf.cameras; // Array<THREE.Camera>
      //     // gltf.asset; // Object
      //     console.log(gltf.scene);
      //     var object = gltf.scene;
      //     // object.position.set(1, -5, -0.75);
      //     // let car = gltf.scene.children[0];
      //     // car.scale.set(0.5, 0.5, 0.5);
      //     this.scene.add(object);
      //     this.animate();
      //   },
      //   (xhr) => {
      //     console.log((xhr.loaded / xhr.total) * 100 + "% loaded");
      //   },
      //   (error) => {
      //     console.error(error);
      //   }
      // );
      // Controls
      this.controls = new OrbitControls(this.camera, this.renderer.domElement);
      this.controls.maxDistance = 2.5;
      this.controls.minDistance = 0.7;
      // geometry
      this.geometry = new THREE.SphereGeometry(0.5, 64, 64);
      // this.geometry = new THREE.PlaneGeometry(20, 20, 32);

      //webcam
      this.videoDomElement = this.$refs.video;
      // initialize the webcam at the window size
      this.webcam = navigator.mediaDevices.getUserMedia({ video: true }).then((stream) => {
        //video.src = window.URL.createObjectURL(stream);
        this.videoDomElement.srcObject = stream;
        this.videoDomElement.play();
      });
      this.videoDomElement.style.display = "none";

      //texture
      this.texture = new THREE.VideoTexture(this.videoDomElement);
      this.texture.minFilter = THREE.LinearFilter;
      this.texture.magFilter = THREE.LinearFilter;
      this.texture.format = THREE.RGBFormat;
      this.shaderMaterial = new THREE.ShaderMaterial({
        vertexShader: `
        uniform float uTime;
        uniform sampler2D tex0;
        varying vec2 vUv;
				varying vec4 vModelPosition;


        void main()
        {
          vUv = uv;
          vec4 cam = texture2D(tex0,vUv);

					vec4 modelPosition = modelMatrix * vec4(position, 1.0);
          // blop petite boule
          modelPosition.x =  modelPosition.x + cos(modelPosition.x * 10.0 + uTime * 0.1) * 0.01;
          // modelPosition.x =  modelPosition.x + cos(modelPosition.x * 100.0 + uTime * 0.1) * 0.05;
          // * 0.1
    			modelPosition.y =  modelPosition.y + cos(modelPosition.y * 10.0 + uTime * 0.1) * 0.01;
          modelPosition.z =  modelPosition.z + sin(modelPosition.y * 10.0 + uTime * 0.1) * 0.01;

    			vec4 viewPosition = viewMatrix * modelPosition;
					vec4 projectedPosition = projectionMatrix * viewPosition;
					
					vModelPosition = modelPosition;

    			gl_Position = projectedPosition;
        }
    `,
        fragmentShader: `
        uniform float uTime;
        uniform sampler2D tex0;
        varying vec2 vUv;
				varying vec4 vModelPosition;
	
        void main()
        {
          vec2 pos = vUv;
          vec4 cam = texture2D(tex0,pos);
          gl_FragColor = cam;
        }
		`,
        uniforms: {
          uTime: { value: this.time },
          tex0: { type: "t", value: this.texture },
        },
      });
      this.mesh = new THREE.Mesh(this.geometry, this.shaderMaterial);
      this.scene.add(this.mesh);
    },
    animate() {
      requestAnimationFrame(this.animate);
      // console.log(this.scene)
      this.time += 1;
      this.mesh.rotation.y += 0.01;
      this.shaderMaterial.uniforms.uTime.value = this.time;
      this.controls.update();
      this.renderer.render(this.scene, this.camera);
    },
  },
  mounted() {
    this.init();
    this.animate();
  },
};
</script>
<style scoped>
.canvas {
  position: fixed;
  width: 80vh;
  height: 80vh;
  top: 10vh;
  left: 50%;
  transform: translateX(-50%);
  z-index: 20;
  border-radius: 50%;
  outline: none;
}
.canvas:focus {
  border: 0px solid transparent;
  outline: none;
}
</style>
