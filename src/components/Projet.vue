<template>
  <div>
    <div class="projet__container">
      <ThreeJsContainer
        :currentFragmentShader="currentProject ? currentProject.fragmentShader : null"
        :currentVertexShader="currentProject ? currentProject.vertexShader : null"
      />
      <div v-show="showPopup" :class="`project__popup ${showPopup}`">
        <div class="projet__title">Try something else</div>
        <div class="projet__content">
          <Button
            v-on:change-index="onChangeIndex"
            v-for="project in projects"
            :key="project.id"
            :project="project"
            :currentProject="currentProjectIndex"
          />
        </div>
      </div>
      <ul class="projet__actions">
        <li class="action__item action__item--frag" @click="showPopup = !showPopup">
          {{ showPopup ? "bored :(" : "bored ?" }}
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import ThreeJsContainer from "../components/ThreeJSContainer.vue";
import Button from "../components/Button.vue";
import { VBigBloupShader } from "../assets/shader/vertex/bigbloup.vert";
import { VProject3Shader } from "../assets/shader/vertex/project3.vert";
import { VProject4Shader } from "../assets/shader/vertex/project4.vert";
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
      currentProjectIndex: 0,
      showPopup: false,
      currentProject: {
        id: 0,
        title: "●◼️",
        vertexShader: VBigBloupShader,
        fragmentShader: "fragmentshader0",
      },
      projects: [
        {
          id: 0,
          title: "try",
          vertexShader: VBigBloupShader,
          fragmentShader: "fragmentshader0",
        },
        {
          id: 1,
          title: "bloup",
          vertexShader: VShader,
          fragmentShader: "fragmentshader2",
        },
        {
          id: 2,
          title: "serpent",
          vertexShader: VProject3Shader,
          fragmentShader: "fragmentshader2",
        },
        {
          id: 3,
          title: "lol",
          vertexShader: VProject4Shader,
          fragmentShader: "fragmentshader2",
        },
      ],
    };
  },
  methods: {
    onChangeIndex(newIndex) {
      if (this.currentProjectIndex === newIndex) {
        // this.currentProjectIndex = null;
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
  /* pointer-events: none; */
  position: absolute;
  /* width: 100vw;
  height: 45vh;
  top: 0%;
  left: 50%;
  transform: translate(-50%, 0%);
  z-index: 4; */
}
.project__popup {
  padding: 1vw 2vw 3vw;
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  max-width: 100vw;
  box-sizing: border-box;
  max-height: 55vh;
  z-index: 30;
  -webkit-backdrop-filter: blur(10px);
  backdrop-filter: blur(10px);
  -webkit-box-shadow: 0px 0px 30px 10px #000000;
  box-shadow: 0px 0px 30px 10px #000000;
  overflow-y: scroll;
}
.projet__title {
  font-size: 10vw;
  margin-bottom: 2vw;
}
.projet__content {
  display: flex;
  flex-wrap: wrap;
}

.action__item {
  position: fixed;
  z-index: 30;
}

.action__item--frag {
  top: 1.5vw;
  left: 2.5vw;
}
.action__item {
  cursor: pointer;
  list-style: none;
  background: white;
  border: 1px solid black;
  color: black;
  font-size: 2vw;
  padding: 0.8vw 2vw;
  border-radius: 52%;
  font-family: "Helvetica", "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
}
.action__item:hover {
  color: rgb(210, 255, 7);
  border-color: rgb(210, 255, 7);
}
.action__item.true {
}
@media screen and (max-width: 900px) {
}
@media screen and (max-width: 500px) {
}
</style>
