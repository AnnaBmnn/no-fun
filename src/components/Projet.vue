<template>
  <div>
    <div class="projet__container">
      <Button
        v-on:change-index="onChangeIndex"
        v-for="project in projects"
        :key="project.id"
        :project="project"
        :currentProject="currentProjectIndex"
      />
    </div>
    <ThreeJsContainer
      :fragmentShader="currentProject ? currentProject.fragmentShader : null"
      :vertexShader="currentProject ? currentProject.vertexShader : null"
      v-show="currentProject !== null"
    />
  </div>
</template>

<script>
import ThreeJsContainer from "../components/ThreeJSContainer.vue";
import Button from "../components/Button.vue";
import { VBigBloupShader } from "../assets/shader/vertex/bigbloup.vert";
import { VShader } from "../assets/shader/vertex/bloup.vert";

export default {
  name: "Projet",
  components: {
    ThreeJsContainer,
    Button,
  },
  watch: {
    currentProjectIndex: function(newIndex) {
      this.currentProject = this.projects[newIndex] ? this.projects[newIndex] : null;
    },
  },
  data() {
    return {
      currentVertexShader: null,
      currentFragmentShader: null,
      currentProjectIndex: null,
      currentProject: null,
      projects: [
        {
          id: 0,
          title: "Projet 0",
          vertexShader: VBigBloupShader,
          fragmentShader: "fragmentshader0",
        },
        {
          id: 1,
          title: "Projet 1",
          vertexShader: VBigBloupShader,
          fragmentShader: "fragmentshader1",
        },
        {
          id: 2,
          title: "Projet 2",
          vertexShader: VShader,
          fragmentShader: "fragmentshader2",
        },
      ],
    };
  },
  methods: {
    onChangeIndex(newIndex) {
      if (this.currentProjectIndex === newIndex) {
        this.currentProjectIndex = null;
      } else {
        this.currentProjectIndex = newIndex;
      }
    },
  },
  mounted() {},
};
</script>

<style scoped>
.projet__container {
  pointer-events: none;
  position: fixed;
  width: 90vw;
  height: 80vh;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 4;
}
.projet {
  margin-bottom: 2vw;
  z-index: 10;
}
.projet__title {
  z-index: 10;
  position: relative;
  pointer-events: initial;
  font-weight: normal;
  font-size: 3.5vw;
  -webkit-box-shadow: 0px 0px 20px 0px #2e2e2e;
  box-shadow: 0px 0px 20px 0px #2e2e2e;
  padding: 0 1.5vw 0.3vw;
  margin: 0 2vw 0 0;
  display: inline-block;
  border-radius: 4.3vw;
  backdrop-filter: blur(8px);
  cursor: pointer;
  color: black;
}
.projet__title:hover {
  color: #ff38ee;
  box-shadow: 0px 0px 30px 10px #ff38ee;
}
.projet__img {
  width: 30vw;
  height: 20vw;
  position: absolute;
  top: 10vw;
  height: 30vw;
  background-color: white;
}
@media screen and (max-width: 900px) {
  .projet__title {
    font-size: 8.5vw;
    padding: 0 4vw 0.3vw;
    margin-bottom: 4vw;
    border-radius: 6vw;
  }
}
@media screen and (max-width: 500px) {
  .projet__title {
    font-size: 12vw;
    padding: 0 5vw 0.3vw;
    border-radius: 7vw;
  }
}
</style>
