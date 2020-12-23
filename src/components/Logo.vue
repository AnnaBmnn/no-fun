<template>
  <a href="" class="logo">?</a>
</template>

<script>
export default {
  name: "Logo",
  data() {
    return {};
  },
  methods: {},
  mounted() {},
};
</script>

<style scoped>
.logo {
  z-index: 10;
  position: fixed;
  right: 5vw;
  top: 5vh;
  color: #ff38ee;
  font-size: 5vw;
  backdrop-filter: blur(8px);
  border-radius: 50%;
  padding: 0 2vw;
}
</style>
