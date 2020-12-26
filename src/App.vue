<template>
  <div id="app">
    <Logo />
    <Projet />
    <List />
  </div>
</template>

<script>
import List from "./components/List.vue";
import Projet from "./components/Projet.vue";
import Logo from "./components/Logo.vue";
// import Loop from "./components/Loop.vue";

export default {
  name: "app",
  components: {
    List,
    Logo,
    Projet,
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
      document.title = timer % 2 === 0 ? "FUN NO" : "NO FUN";
    }, 500);
  },
};
</script>

<style lang="scss">
// @font-face {
//   font-family: "Migra";
//   src: local("Migra"), url(./assets/fonts/Migra/Migra-Regular.ttf) format("truetype");
// }
body {
  // font-family: "Migra";
  background-color: #814200;
  background-color: #7bd8ff;
  background-color: white;
  margin: 0;
  padding: 0;
  overflow-x: hidden;
  white-space: nowrap;
}
</style>
