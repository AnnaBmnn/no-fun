<template>
  <div>
    <h1 class="fixed js-fixed">
      <span class="title title--top title--fixed">{{ titleTop }}</span>
      <span class="title title--bottom title--fixed">{{ titleBottom }}</span>
    </h1>
    <section class="hero ">
      <h1 class="title title--top">{{ titleTop }}</h1>
      <h1 class="title title--bottom">{{ titleBottom }}</h1>
    </section>
  </div>
</template>
<script>
export default {
  props: {
    titleTop: {
      type: String,
      required: false,
    },
    titleBottom: {
      type: String,
      required: false,
    },
  },
};
</script>
<style scoped>
.hero {
  position: relative;
  height: 100vh;
  color: #020202;
}

.title--top {
  position: absolute;
  left: 14px;
  top: 0px;
  margin: 0;
  font-size: 16vw;
  line-height: 0.9;
  /* mix-blend-mode: difference; */
  color: #020202;
}

.title--bottom {
  position: absolute;
  left: 14px;
  bottom: 14px;
  margin: 0;
  line-height: 0.9;
  font-size: 20vw;
}

.fixed {
  position: fixed;
  height: 100vh;
  width: 100vw;
  opacity: 1;
  /* z-index: -1; */
}

.title--fixed {
  z-index: -1;
  position: fixed;
  /* color: #00ff00; */
  color: #fdff9b;
  /* color: #ff7700; */
}
</style>
