<template>
  <div>
    <div class="projet__container">
      <ThreeJsContainer
        :currentFragmentShader="currentProject ? currentProject.fragmentShader : null"
        :currentVertexShader="currentProject ? currentProject.vertexShader : null"
      />
      <div
        v-show="showPopupBored"
        :class="
          `project__popup project__popup--bored ${
            isPopUpPUzzledOnTop ? 'zindextop' : ''
          }  ${showPopupBored}`
        "
      >
        <div class="projet__title">Try some&shy;thing else</div>
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
        <ul class="project__con">
          <li class="project__inf">
            No-FUN is a place where I transform my
            <span class="toggle-fun__container"
              ><span class="toggle-fun__always">no-fun </span
              ><span class="toggle-fun__hover"><span class="underline">no</span>-fun</span></span
            >
            moment in a very
            <span class="toggle-fun__container"
              ><span class="toggle-fun__always"> ☻ fun ☻ </span
              ><span class="toggle-fun__hover">no fun</span></span
            >
            moment by doing shader, which become very soon
            <span class="toggle-fun__container"
              ><span class="toggle-fun__always">not so </span
              ><span class="toggle-fun__hover underline">not so</span></span
            >
            fun
            <span class="toggle-fun__container"
              ><span class="toggle-fun__always rotate">☻</span
              ><span class="toggle-fun__hover ">☻</span></span
            >
            again : indeed debugging shaders is a nightmare. But anyways, it’s fun again when it’s
            <br />
            ☻☻☻ WORKS ☻☻☻.
          </li>
          <li class="project__inf">
            I hope
            <span class="toggle-fun__container"
              ><span class="toggle-fun__always">(<span class="underline">no</span>)fun </span
              ><span class="toggle-fun__hover "><span class="">(no)fun</span> </span></span
            >
            can help you transform your
            <span class="toggle-fun__container"
              ><span class="toggle-fun__always">not fun</span
              ><span class="toggle-fun__hover "
                ><span class="underline hidden-xs">not</span> fun
              </span></span
            >
            <span class="toggle-fun__container"
              ><span class="toggle-fun__always rotate"> ☻ </span
              ><span class="toggle-fun__hover "> ☻ </span></span
            >
            moment of doomscrolling on the world wide web in a very fun ego trip (lol).
          </li>
          <li class="project__inf">
            If you want to chat, feel free to ➺
            <a href="mailto:annabaumann.hello@gmail.com" class="link" target="_blank"
              >contact me
            </a>
            <span class="rotate">➺</span>
            and if you want to stalk, feel free to <br />
            ➺
            <a href="https://www.instagram.com/bannabmnn.cyber/" class="link" target="_blank"
              >stalk me </a
            ><span class="rotate">➺</span>.
          </li>
        </ul>
      </div>
      <ul class="projet__actions">
        <li
          :class="
            `action__item action__item--frag ${showPopupBored ? 'open' : 'close'} ${
              isPopUpPUzzledOnTop ? 'zindextopbtn' : ''
            }`
          "
          ref="btnBored"
          @mouseenter="addBored = 0"
          @mouseleave="addBored = 5"
          @click="showPopupBored = !showPopupBored"
        >
          {{ showPopupBored ? "close" : "bored ?" }}
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
import { VProject5Shader } from "../assets/shader/vertex/project5.vert";
import { VProject6Shader } from "../assets/shader/vertex/project6.vert";
import { VProject7Shader } from "../assets/shader/vertex/project7.vert";
import { VProject8Shader } from "../assets/shader/vertex/project8.vert";
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
    showPopupBored: function(newPopupBored) {
      if (this.showPopupPuzzled == true && newPopupBored == true) {
        this.isPopUpPUzzledOnTop = true;
      }
      // if (this.showPopupPuzzled == true && newPopupBored == false) {
      //   this.isPopUpPUzzledOnTop = false;
      // }
    },
    showPopupPuzzled: function(newPopupPuzzled) {
      if (newPopupPuzzled == false) {
        this.isPopUpPUzzledOnTop = false;
      }
    },
  },
  data() {
    return {
      isPopUpPUzzledOnTop: false,
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
          title: "speedo",
          vertexShader: VProject4Shader,
          fragmentShader: "fragmentshader2",
        },
        {
          id: 4,
          title: "<!-!>",
          vertexShader: VProject5Shader,
          fragmentShader: "fragmentshader2",
        },
        {
          id: 5,
          title: "spirale",
          vertexShader: VProject6Shader,
          fragmentShader: "fragmentshader2",
        },
        {
          id: 6,
          title: "normal",
          vertexShader: VProject7Shader,
          fragmentShader: "fragmentshader2",
        },
        {
          id: 7,
          title: "soap",
          vertexShader: VProject8Shader,
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
      // requestAnimationFrame(this.positionneRandom);
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
    // this.positionneRandom();
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
  z-index: 30;
}
@-moz-document url-prefix() {
  .project__popup--bored {
    background-color: rgba(255, 255, 255, 0.8);
  }
}
/* .project__popup--bored::before {
  content: "";

  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  filter: blur(10px);
  z-index: -1;
} */
.project__popup--puzzled {
  top: 0;
  right: 0;
  width: 45vw;
  height: 100vh;
  background-color: rgba(0, 0, 0, 0.9);
  color: white;
  z-index: 50;
}
.projet__title {
  font-size: 10vw;
  margin-bottom: 2vw;
  white-space: initial;
  line-height: 0.9;
}
.projet__content {
  width: 75%;
  display: flex;
  flex-wrap: wrap;
}
.project__con {
  white-space: initial;
  font-size: 1.4rem;
  width: 75%;
  margin-top: 2rem;
}

.project__inf {
  font-family: "Helvetica", "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
  text-transform: uppercase;
  font-weight: 100;
  /* font-family: serif; */
  position: relative;
  list-style: none;
  margin-bottom: 1.5rem;
  display: inline-block;
  line-height: 130%;
}

.project__inf:before {
  content: "➺";
  position: absolute;
  left: -30px;
  top: 0;
}

.action__item {
  position: fixed;
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
.action__item--frag {
  right: 1.5vw;
  top: 1.5vw;
  /* top: 1.5vw;
  left: 2.5vw; */
  z-index: 40;
  transform: translate3d(var(--tx), var(--ty), 0);
  /* animation: scale 3s infinite linear; */
  color: rgb(7, 255, 110);
  border-color: rgb(7, 255, 110);
  box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.7);
}
.action__item--frag.open {
  animation: none;
}
.action__item--per {
  right: 1.5vw;
  bottom: 1.5vw;
  z-index: 60;
  color: rgb(230, 255, 7);
  border-color: rgb(230, 255, 7);
  box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.7);
  /* animation: scale 3s infinite linear; */
}
.action__item--per:hover {
  color: rgb(230, 255, 7);
  border-color: rgb(230, 255, 7);
  transform: scale(1.05);
}

.action__item--frag:hover {
  color: rgb(7, 255, 110);
  border-color: rgb(7, 255, 110);
  box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.7);
}
.zindextop {
  z-index: 70;
}
.zindextopbtn {
  z-index: 80;
}
.action__item.true {
}
.toggle-fun__container {
  /* text-decoration: underline; */
  position: relative;
}
.toggle-fun__always {
  /* position: absolute; */
  left: 0;
  opacity: 1;
  animation: opacityAlot 3s linear infinite;
}
.toggle-fun__hover {
  position: absolute;
  left: 0;
  opacity: 0;
  animation: opacityAlittle 3s linear infinite;
}
.toggle-fun__container:hover .toggle-fun__always {
  opacity: 0;
}
.toggle-fun__container:hover .toggle-fun__hover {
  opacity: 1;
}
.link {
  color: white;
  text-decoration: none;
}
.link:hover {
  color: white;
  text-decoration: underline;
}
.underline {
  text-decoration: line-through;
}
.rotate {
  display: inline-block;
  transform: translateY(-2px) rotateZ(-180deg);
}

@media screen and (max-width: 900px) {
}
@media screen and (max-width: 800px) {
  .project__popup--puzzled {
    width: 86vw;
  }
  .action__item {
    font-size: 8vw;
    padding: 1.6vw 4vw;
    border-radius: 53%;
  }
  .projet__title {
    /* width: 85vw; */
    font-size: 20vw;
    font-weight: 500;
    margin-bottom: 2.6vw;
    white-space: normal;
    line-height: 0.85;
    /* word-break: break-all; */
    margin-bottom: 40px;
    letter-spacing: -0.7vw;
  }
  .projet__content {
    width: 100%;
  }
  .project__con {
    white-space: normal;
    font-size: 1.2rem;
    width: 85%;
    margin-top: 3rem;
    margin-bottom: 20vh;
  }
  .action__item--frag {
    transform: translate(0, 0) !important;
    left: initial;
    right: 3vw;
    top: 3vw;
  }
  .hidden-xs {
    display: none;
  }
}
@media screen and (max-width: 500px) {
  .project__popup--bored {
    height: 45vh;
  }
}

@keyframes opacityAlot {
  0% {
    opacity: 0;
  }

  30% {
    opacity: 0;
  }
  31% {
    opacity: 1;
  }

  100% {
    opacity: 1;
  }
}
@keyframes opacityAlittle {
  0% {
    opacity: 1;
  }

  30% {
    opacity: 1;
  }

  31% {
    opacity: 0;
  }

  100% {
    opacity: 0;
  }
}
@keyframes scale {
  0% {
    transform: scale(1);
  }
  50% {
    transform: scale(1.2);
  }
  100% {
    transform: scale(1);
  }
}
</style>
