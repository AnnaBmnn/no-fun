<template>
  <div ref="container" class="list__container">
    <ul class="list item">
      <li class="list__item list__item--0">
        <FoldItem :scrollAmount="scrollAmount" :sign="1" class="list__item"> </FoldItem>
      </li>
      <li class="list__item list__item--1">
        <FoldItem :scrollAmount="scrollAmount" :sign="0" class="list__item"> </FoldItem>
      </li>
      <li class="list__item list__item--2">
        <FoldItem :scrollAmount="scrollAmount" :sign="1" class="list__item"> </FoldItem>
      </li>
      <li class="list__item list__item--3">
        <FoldItem :scrollAmount="scrollAmount" :sign="0" class="list__item"> </FoldItem>
      </li>
      <li class="list__item list__item--4">
        <FoldItem :scrollAmount="scrollAmount" :sign="1" class="list__item"> </FoldItem>
      </li>
      <li class="list__item list__item--5">
        <FoldItem :scrollAmount="scrollAmount" :sign="0" class="list__item"> </FoldItem>
      </li>
      <li class="list__item list__item--6">
        <FoldItem :scrollAmount="scrollAmount" :sign="1" class="list__item"> </FoldItem>
      </li>
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
    };
  },
  mounted() {
    const vm = this;
    //When the window has loaded we're going to work out the dimentions
    window.addEventListener("load", () => {
      vm.getDimensions();
    });

    //When the window is resized we want to re-calculate the dimentions
    window.addEventListener(
      "resize",
      () => {
        vm.getDimensions();
      },
      true
    );
    //When the element is scrolled
    window.addEventListener(
      "scroll",
      () => {
        console.log("event");
        console.log(event);
        this.scrollAmount = window.scrollY;
        vm.scrollHandler();
      },
      true
    );
  },
  methods: {
    /**
     * Scroll handler
     */

    scrollHandler() {
      console.log(window.scrollY);
    },
    /**
     * Get dimentions of the page and viewport
     */

    getDimensions() {
      console.log("dimansion");
      // const vm = this;
      // const container = vm.$el;
    },
    /**
     * Make duplicates so the scroll is smooth
     */

    makeDuplicates() {
      // const container = this.$el;
    },
  },
};
</script>

<style scoped>
.list__container {
  height: 500vh;
}
.list {
  height: 500vh;
  overflow-y: hidden;
  margin: 0;
  padding: 0;
  width: 600vw;
  position: fixed;
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
.list__item.list__item--0 {
  transform: translate(-94.5vh);
}
.list__item.list__item--1 {
  transform: skewX(60deg) translateX(-80.5vh);
}
.list__item.list__item--2 {
  transform: translate(-66.3vh, -0.1vh);
}
.list__item.list__item--3 {
  transform: skewX(60deg) translate(-52vh, -0.1vh);
}
.list__item.list__item--4 {
  transform: translate(-38vh, -0.1vh);
}
.list__item.list__item--5 {
  transform: skewX(60deg) translate(-23.5vh, -0.1vh);
}
.list__item.list__item--6 {
  transform: translate(-9.5vh, -0.2vh);
}
</style>
