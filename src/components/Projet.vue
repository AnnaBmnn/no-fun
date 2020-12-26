<template>
  <div class="projet__container">
    <div class="projet">
      <h2 class="projet__title">ego solitaire</h2>
    </div>
    <div class="projet">
      <h2 class="projet__title">un autre projet</h2>
    </div>
  </div>
</template>

<script>
export default {
  name: "Projet",
  data() {
    return {};
  },
  methods: {},
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
</style>
