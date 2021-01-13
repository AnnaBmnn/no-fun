<template>
  <div id="app">
    <Projet />
    <Fold />
  </div>
</template>

<script>
import Fold from "./components/Fold.vue";
import Projet from "./components/Projet.vue";

export default {
  name: "app",
  components: {
    Fold,
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
      document.title = timer % 2 === 0 ? "FUN" : "NO FUN";
    }, 500);
  },
};
</script>

<style lang="scss">
body {
  height: é100vh;
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
