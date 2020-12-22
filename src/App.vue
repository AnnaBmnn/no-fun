<template>
  <div id="app">
    <List />
    <Projet />
  </div>
</template>

<script>
import List from "./components/List.vue";
import Projet from "./components/Projet.vue";

export default {
  name: "app",
  components: {
    List,
    Projet,
  },
};
</script>

<style lang="scss">
// @font-face {
// font-family: "Migra";
// src: local("Migra"), url(./assets/fonts/Migra/Migra-Regular.ttf) format("truetype");
// }
body {
  // font-family: "Migra";
  background-color: #000000;
  margin: 0;
  padding: 0;
  overflow-x: hidden;
  white-space: nowrap;
}
</style>
