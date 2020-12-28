<template>
  <li ref="animationFlat" :class="`list__item list__item--${index} ${animationType}`">
    <div class="content" ref="animation3d">
      <div v-for="n in 20" :key="n">
        {{ (n + sign) % 2 == 0 ? contentFun : contentNoFun }}
      </div>
    </div>
  </li>
</template>

<script>
export default {
  name: "FoldItem",
  props: {
    index: {
      type: Number,
      require: false,
    },
    sign: {
      type: Number,
      require: false,
    },
    scrollAmount: {
      type: Number,
      require: false,
      default: 0,
    },
    animationType: {
      type: String,
      require: false,
      default: "animation3d",
    },
  },
  data() {
    return {
      contentNoFun:
        "no fun no fun no fun no fun no fun no fun no fun no fun no fun no fun no fun no fun",
      contentFun: "fun fun fun fun fun fun fun fun fun fun fun fun ",
      newScrollValue: 0,
    };
  },
  watch: {
    scrollAmount: function(newValue) {
      this.newScrollValue = newValue;
      requestAnimationFrame(this.animate);
    },
  },
  methods: {
    animate: function() {
      if (this.animationType === "animationFlat") {
        const transform =
          this.sign % 2 == 1
            ? `translate(0px, -${this.newScrollValue}px)`
            : `skew(60deg) translate(-${this.newScrollValue}px, -${this.newScrollValue}px)`;
        this.$refs.animationFlat.style.transform = transform;
      } else {
        const transform = ` translate(0px, -${this.newScrollValue}px)`;
        this.$refs.animation3d.style.transform = transform;
      }
    },
  },
};
</script>

<style scoped>
.list__item {
  height: 16.5vh;
  overflow-y: hidden;
  margin: 0;
  list-style: none;
  font-size: 24vh;
  line-height: 0.7;
  text-transform: uppercase;
  color: black;
}
.content {
  position: relative;
}
.list__item {
  height: 16.5vh;
  overflow-y: hidden;
  margin: 0;
  list-style: none;
  font-size: 24vh;
  line-height: 0.7;
  text-transform: uppercase;
  color: black;
}

.list__item:nth-child(even) {
  transform: skewX(60deg);
}
.list__item:nth-child(odd) {
  /* transform: skewX(-60deg); */
}

.animation3d.list__item.list__item--1 {
  transform: translate(-94.5vh);
}
.animation3d.list__item.list__item--2 {
  transform: skewX(60deg) translateX(-80.5vh);
}
.animation3d.list__item.list__item--3 {
  transform: translate(-66.3vh, -0.1vh);
}
.animation3d.list__item.list__item--4 {
  transform: skewX(60deg) translate(-52vh, -0.1vh);
}
.animation3d.list__item.list__item--5 {
  transform: translate(-38vh, -0.1vh);
}
.animation3d.list__item.list__item--6 {
  transform: skewX(60deg) translate(-23.5vh, -0.1vh);
}
.animation3d.list__item.list__item--7 {
  transform: translate(-9.5vh, -0.2vh);
}
</style>
