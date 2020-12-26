<template>
  <div class="loop-container full">
    <slot></slot>
  </div>
</template>

<script>
export default {
  /**
   * Define props
   */
  props: {},
  /**
   * Initialize default data
   *
   * @return {object}
   */

  data() {
    return {
      pageHeight: 0,
      viewportHeight: 0,
      pageWidth: 0,
      viewportWidth: 0,
      duplicates: false,
    };
  },
  /**
   * When the component is mounted
   */

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
      if (window.scrollY >= this.viewportHeight * 2 - 200) {
        window.scroll(0, 0);
      }
    },
    /**
     * Get dimentions of the page and viewport
     */

    getDimensions() {
      const vm = this;
      vm.viewportHeight = window.innerHeight;
    },
  },
};
</script>

<style>
.loop-container {
  display: block;
  /* overflow-y: scroll; */
  -webkit-overflow-scrolling: touch;
}
.loop-container.full {
  display: flex;
  flex-direction: column;
  flex-wrap: nowrap;
  align-items: stretch;
  justify-content: flex-start;
  position: absolute;
  top: 0px;
  bottom: 0px;
  left: 0px;
  right: 0px;
}
.loop-container.full > .item {
  min-width: 100%;
  min-height: 100%;
  flex: 1;
  backface-visibility: hidden;
  transform: translate3d(0, 0, 0);
}
</style>
