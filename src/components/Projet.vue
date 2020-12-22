<template>
  <div class="projet">
    <h2 class="projet__title">ego solitaire →</h2>
    <h2 class="projet__title">ego solitaire</h2>
    <h2 class="projet__title">ego solitaire</h2>
    <h2 class="projet__title">ego solitaire</h2>
    <h2 class="projet__title">ego solitaire</h2>
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
.projet {
  position: fixed;
  width: 80vw;
  height: 80vh;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
.projet__title {
  font-weight: normal;
  font-size: 6vw;
  /* -webkit-box-shadow: 10px 2px 20px 7px #d0ff00; */
  /* box-shadow: 0px 0px 20px 7px #000000; */
  /* text-shadow: #fc0 1px 0 10px; */
  padding: 6px 20px 10px;
  margin: 0;
  /* border-radius: 3vw; */
  /* border-radius: 50%; */
  -webkit-backdrop-filter: blur(3px);
  backdrop-filter: blur(3px);
  cursor: pointer;
  color: #d0ff00;
  width: 100%;
  border-bottom: 4px solid #d0ff00;
}
</style>
