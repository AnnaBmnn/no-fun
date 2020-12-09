<template>
  <div>
    <h1 class="fixed js-fixed">
      <span class="title title--top title--fixed">{{ titleTop }}</span>
      <span class="title title--bottom title--fixed">{{ titleBottom }}</span>
    </h1>
    <section class="hero ">
      <span class="title title--top">{{ titleTop }}</span>
      <span class="title title--bottom">{{ titleBottom }}</span>
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
  font-weight: bold;
}
@media screen and (max-width: 800px) {
  .title--top {
    font-size: 16vw;
  }
}

.title--bottom {
  position: absolute;
  left: 14px;
  bottom: 14px;
  margin: 0;
  line-height: 0.9;
  font-size: 20vw;
  font-weight: bold;
}

.fixed {
  position: fixed;
  height: 100vh;
  width: 100vw;
  opacity: 1;
  z-index: -1;
}

.title--fixed {
  z-index: -1;
  position: fixed;
  color: #fdff9b;
}
@media screen and (max-width: 800px) {
  .hero {
    height: 60vh;
  }
  .title--top {
    left: 10px;
  }
  .title--bottom {
    left: 10px;
    top: 14vw;
    font-size: 18vw;
    bottom: unset;
  }
}
</style>
