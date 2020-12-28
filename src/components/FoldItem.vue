<template>
  <div>
    <div ref="content" class="content">
      <div v-for="n in 20" :key="n">
        {{ (n + sign) % 2 == 0 ? contentFun : contentNoFun }}
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "FoldItem",
  props: {
    sign: {
      type: Number,
      require: false,
    },
    scrollAmount: {
      type: Number,
      require: false,
      default: 0,
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
      this.$refs.content.style.transform = `translate(-${this.newScrollValue}px, -${this.newScrollValue}px)`;
      console.log(this.$refs.content);
      console.log(this.newScrollValue);
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
</style>
