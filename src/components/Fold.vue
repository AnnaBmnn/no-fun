<template>
  <div ref="container" class="list__container">
    <ul class="list item">
      <FoldItem
        v-for="n in 7"
        :key="n"
        :index="n"
        :scrollAmount="scrollAmount"
        :sign="n % 2 == 0 ? 0 : 1"
        :animationType="animationType"
        class="list__item"
      >
      </FoldItem>
    </ul>
  </div>
</template>

<script>
import FoldItem from "./FoldItem.vue";

export default {
  name: "List",
  components: {
    FoldItem,
  },
  data() {
    return {
      scrollAmount: 0,
      contentNoFun: "no fun no fun no fun no fun no fun no fun",
      contentFun: "fun fun fun fun fun fun ",
      animations: ["animationFlat", "animationHorizontal", "animation3d"],
    };
  },
  computed: {
    // un accesseur (getter) calculé
    animationType: function() {
      // `this` pointe sur l'instance vm
      // const animationsLength = this.animations.length;
      // const randomIndex = Math.floor(Math.random() * Math.floor(animationsLength));
      // return this.animations[randomIndex];
      return "2";
    },
  },
  mounted() {
    // const vm = this;
    //When the window has loaded we're going to work out the dimentions
    window.addEventListener("load", () => {
      // vm.getDimensions();
    });

    //When the window is resized we want to re-calculate the dimentions
    window.addEventListener(
      "resize",
      () => {
        // vm.getDimensions();
      },
      true
    );
    //When the element is scrolled
    window.addEventListener(
      "scroll",
      () => {
        // vm.scrollHandler();
      },
      true
    );
  },
  methods: {
    /**
     * Scroll handler
     */

    scrollHandler() {
      this.scrollAmount = window.scrollY;
    },
  },
};
</script>

<style scoped>
.list__container {
  width: 100vw;
  overflow: hidden;
  height: 100vh;
}
.list {
  height: 100vh;
  overflow: hidden;
  margin: 0;
  padding: 0;
  width: 140vw;
  position: fixed;
}
</style>
