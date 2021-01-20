<template>
  <div>
    <div class="projet__container">
      <ThreeJsContainer
        :currentFragmentShader="currentProject ? currentProject.fragmentShader : null"
        :currentVertexShader="currentProject ? currentProject.vertexShader : null"
      />
      <div
        v-show="showPopupBored"
        :class="`project__popup project__popup--bored ${showPopupBored}`"
      >
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
      <div
        v-show="showPopupPuzzled"
        :class="`project__popup project__popup--puzzled  ${showPopupBored}`"
      >
        <div class="projet__title">Why (no) fun ?</div>
        <div class="project__con">
          * No-FUN is a place where I transform my no-fun moment in very fun moment by doing shader,
          wich become very soon some not so fun moment again. Because debugging shaders is such a
          nightmare. But anyways, it’s fun again when it’s WORKS. * I hope no-fun can helps you
          transforms your not-fun moment of doom scrolling on the world wide web in very fun ego
          trip. * if you want to chat, feel free to contact me and if you want to stalk, feel free
          to stalk me.
        </div>
      </div>
      <ul class="projet__actions">
        <li
          class="action__item action__item--frag"
          ref="btnBored"
          @mouseenter="addBored = 0"
          @mouseleave="addBored = 5"
          @click="showPopupBored = !showPopupBored"
        >
          {{ showPopupBored ? "bored :(" : "bored ?" }}
        </li>
        <li
          class="action__item action__item--per"
          ref="btnPer"
          @mouseenter="addPuzzled = 0"
          @mouseleave="addPuzzled = 5"
          @click="showPopupPuzzled = !showPopupPuzzled"
        >
          {{ showPopupPuzzled ? "FUN" : "NO FUN ?!?!" }}
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
      showPopupBored: false,
      showPopupPuzzled: false,
      windowHeight: 0,
      windowWidth: 0,
      btnBoredHeight: 0,
      btnBoredWidth: 0,
      posBtnBored: {
        x: 0,
        y: 0,
      },
      sign: {
        x: 1,
        y: 1,
      },
      addBored: 5,
      addPuzzled: 5,
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
    initRandomMove() {
      console.log(this.$refs.btnBored);
      // setInterval(this.positionneRandom, 100);
    },
    positionneRandom() {
      // this.posBtnBored.x = this.randomIntFromInterval(0, this.windowWidth) + "px";
      // this.posBtnBored.y = this.randomIntFromInterval(0, this.windowHeight * 0.4) + "px";
      this.posBtnBored.x += this.addBored * this.sign.x;
      this.posBtnBored.y += this.addBored * this.sign.y;

      if (this.posBtnBored.x < 0 || this.posBtnBored.x > this.windowWidth - this.btnBoredWidth) {
        this.sign.x = this.sign.x * -1;
      }
      if (
        this.posBtnBored.y < 0 ||
        this.posBtnBored.y > this.windowHeight * 0.4 - this.btnBoredHeight
      ) {
        this.sign.y = this.sign.y * -1;
      }

      const _x = this.posBtnBored.x + "px";
      const _y = this.posBtnBored.y + "px";
      document.documentElement.style.setProperty("--tx", _x);
      document.documentElement.style.setProperty("--ty", _y);
      // this.$refs.btnBored.style.transform = `translate(${this.posBtnBored.x}px, ${this.posBtnBored.y}px)`;
      requestAnimationFrame(this.positionneRandom);
    },
    randomIntFromInterval(min, max) {
      // min and max included
      return Math.floor(Math.random() * (max - min + 1) + min);
    },
  },
  mounted() {
    this.windowHeight = window.innerHeight;
    this.windowWidth = window.innerWidth;
    this.btnBoredHeight = this.$refs.btnBored.offsetHeight;
    this.btnBoredWidth = this.$refs.btnBored.offsetWidth;
    this.positionneRandom();
  },
};
</script>

<style scoped>
:root {
  --tx: 0;
  --ty: 0;
}

.projet__container {
  position: absolute;
}
.project__popup {
  padding: 1vw 2vw 3vw;
  position: fixed;
  box-sizing: border-box;
  z-index: 30;
  -webkit-backdrop-filter: blur(10px);
  backdrop-filter: blur(10px);
  -webkit-box-shadow: 0px 0px 30px 10px #000000;
  box-shadow: 0px 0px 30px 10px #000000;
  overflow-y: scroll;
}
.project__popup--bored {
  top: 0;
  left: 0;
  width: 100vw;
  max-width: 100vw;
  height: 40vh;
}
.project__popup--puzzled {
  top: 0;
  right: 0;
  width: 45vw;
  height: 100vh;
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
  top: 0vw;
  left: 0vw;
  /* top: 1.5vw;
  left: 2.5vw; */
  transform: translate3d(var(--tx), var(--ty), 0);
}
.action__item--per {
  right: 1.5vw;
  bottom: 1.5vw;
}
.action__item--per:hover {
  color: rgb(230, 255, 7);
  border-color: rgb(230, 255, 7);
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
.action__item--frag:hover {
  color: rgb(7, 255, 110);
  border-color: rgb(7, 255, 110);
}
.action__item.true {
}
@media screen and (max-width: 900px) {
}
@media screen and (max-width: 500px) {
}
</style>
