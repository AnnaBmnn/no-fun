<template>
  <div id="app">
    <Logo />

    <Projet />
    <Loop>
      <Fold />
    </Loop>
  </div>
</template>

<script>
import Fold from "./components/Fold.vue";
import Projet from "./components/Projet.vue";
import Logo from "./components/Logo.vue";
import Loop from "./components/Loop.vue";

export default {
  name: "app",
  components: {
    Fold,
    Logo,
    Projet,
    Loop,
  },
  created() {
    let timer = 0;
    // const titleString = "NO-FUN-NO-FUN-";
    // let titleArray = ["NO", "-", "FUN", "-", "NO", "-", "FUN", "-"];
    // let titleArray = Array.from(titleString);
    setInterval(function() {
      timer += 1;
      // let firstLetter = titleArray[0];
      // titleArray.shift();
      // titleArray.push(firstLetter);
      // document.title = titleArray.join("");
      document.title = timer % 2 === 0 ? "FUN" : "NO FUN";
    }, 500);
  },
};
</script>

<style lang="scss">
body {
  height: 300vh;
  background-color: #814200;
  background-color: #7bd8ff;
  background-color: white;
  margin: 0;
  padding: 0;
  overflow-x: hidden;
  white-space: nowrap;
  font-family: Times, "Times New Roman", Georgia, serif;
}
</style>
