<template>
  <div id="app">
    <Logo />
    <List />
    <Projet />
  </div>
</template>

<script>
import List from "./components/List.vue";
import Projet from "./components/Projet.vue";
import Logo from "./components/Logo.vue";

export default {
  name: "app",
  components: {
    List,
    Projet,
    Logo,
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
