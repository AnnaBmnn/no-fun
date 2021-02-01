<template>
  <div>
    <canvas id="canvas" class="canvas"></canvas>
    <video ref="video"></video>
  </div>
</template>

<script>
import * as THREE from "three";
// import { VShader } from "../assets/shader/vertex/bloup.vert";
import { FBaseShader } from "../assets/shader/fragment/base.frag";
import { FBaseVideoShader } from "../assets/shader/fragment/baseVideo.frag";
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
      vertexShader: null,
      fragmentSahder: FBaseShader,
      shaderMaterial: null,
      mesh: null,
      hlight: null,
      light: null,
      ligh2: null,
      time: 0,
      webcam: null,
      videoDomElement: null,
      isWebcamAllowed: false,
      permissionState: false,
    };
  },
  props: {
    currentVertexShader: {
      type: String,
      require: false,
    },
    currentFragmentShader: {
      type: String,
      require: false,
    },
  },
  watch: {
    currentVertexShader: function(newVertexShader) {
      this.vertexShader = newVertexShader;
      this.setShaderMaterial();
    },
    isWebcamAllowed: function() {
      if (this.isWebcamAllowed) {
        this.setWebcam();
      }
      this.toggleTextureWebcam();
    },
    texture: function(newTexture) {
      if (this.shaderMaterial.tex0) {
        this.shaderMaterial.tex0.value = newTexture;
      }
    },
    permissionState: function(newState) {
      if (newState === "denied") {
        this.isWebcamAllowed = false;
      } else if (newState === "granted") {
        this.isWebcamAllowed = true;
      } else {
        this.isWebcamAllowed = true;
      }
    },
  },
  methods: {
    init() {
      // Scene
      this.scene = new THREE.Scene();
      // this.scene.background = new THREE.Color(0xdddddd);

      // Camera
      this.camera = new THREE.PerspectiveCamera(
        75,
        window.innerWidth / window.innerHeight,
        0.1,
        1000
      );
      this.camera.position.z = 5;

      // Rendering
      this.renderer = new THREE.WebGLRenderer({
        canvas: document.getElementById("canvas"),
        antialias: true,
        alpha: true,
      });
      this.renderer.setClearColor(0xffffff, 0);
      this.renderer.setPixelRatio(window.devicePixelRatio);
      this.renderer.setSize(window.innerWidth, window.innerHeight);

      // Controls
      this.controls = new OrbitControls(this.camera, this.renderer.domElement);
      this.controls.maxDistance = window.innerWidth < 500 ? 1.5 : 2.2;
      this.controls.minDistance = 0.7;

      // Geometry
      this.geometry = new THREE.SphereGeometry(0.5, 64, 64);
      // this.geometry = new THREE.PlaneGeometry(20, 20, 32);

      this.videoDomElement = this.$refs.video;
      this.videoDomElement.style.display = "none";

      // shader materials
      this.vertexShader = this.currentVertexShader;
      this.fragmentShader = FBaseShader;
      this.setShaderMaterial();

      // Mesh
      this.mesh = new THREE.Mesh(this.geometry, this.shaderMaterial);
      this.scene.add(this.mesh);
    },

    animate() {
      requestAnimationFrame(this.animate);

      this.time += 1;
      this.shaderMaterial.uniforms.uTime.value = this.time;

      this.mesh.rotation.y += 0.01;
      this.controls.update();
      this.renderer.render(this.scene, this.camera);
    },
    setWebcam() {
      // initialize the webcam at the window size
      this.webcam = navigator.mediaDevices.getUserMedia({ video: true }).then((stream) => {
        //video.src = window.URL.createObjectURL(stream);
        this.videoDomElement.srcObject = stream;
        this.videoDomElement.play();
        const isSafari = /apple/i.test(navigator.vendor);
        const isFirefox = navigator.userAgent.toLowerCase().indexOf("firefox") > -1;

        if (isSafari || isFirefox) {
          this.isWebcamAllowed = true;
        }
      });
    },
    toggleTextureWebcam() {
      if (this.isWebcamAllowed) {
        this.texture = new THREE.VideoTexture(this.videoDomElement);
        this.texture.minFilter = THREE.LinearFilter;
        this.texture.magFilter = THREE.LinearFilter;
        this.texture.format = THREE.RGBFormat;
        this.fragmentShader = FBaseVideoShader;
      } else {
        // Shader
        this.texture = null;
        this.fragmentShader = FBaseShader;
      }
      this.setShaderMaterial();
    },
    getPermissonWebcam() {
      const isSafari = /apple/i.test(navigator.vendor);
      const isFirefox = navigator.userAgent.toLowerCase().indexOf("firefox") > -1;

      if (!isSafari && !isFirefox) {
        navigator.permissions.query({ name: "camera" }).then((res) => {
          this.permissionState = res.state;
          if (res.state === "denied") {
            this.setWebcam();
          }
          res.onchange = (e) => {
            // detecting if the event is a change
            if (e.type === "change") {
              this.permissionState = e.target.state;
            }
          };
        });
      } else {
        this.setWebcam();
        this.toggleTextureWebcam();
      }
    },
    setShaderMaterial() {
      this.shaderMaterial = new THREE.ShaderMaterial({
        vertexShader: this.vertexShader,
        fragmentShader: this.fragmentShader,
        uniforms: {
          uTime: { value: this.time },
          tex0: { type: "t", value: this.texture },
        },
      });
      if (this.mesh !== null) {
        this.mesh.material = this.shaderMaterial;
      }
    },
  },
  mounted() {
    this.init();
    this.animate();
    let md = navigator.mediaDevices;
    if (!md || !md.enumerateDevices) {
      this.isWebcamAllowed = false;
      this.toggleTextureWebcam();
    } else {
      this.getPermissonWebcam();
    }
    console.log(this.permissionState);

    if (this.permissionState == false) {
      // console.log("here");
      // this.setWebcam();
      // this.toggleTextureWebcam();
    }
  },
};
</script>
<style scoped>
.canvas {
  position: fixed;
  width: 100vw;
  height: 100vh;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 20;
  /* border-radius: 50%; */
  outline: none;
}
.canvas:focus {
  border: 0px solid transparent;
  outline: none;
}
</style>
