<template>
  <div class="button" v-on:click="handleCLick">
    <h2 :class="`button__title ${currentProject == project.id ? 'is-current' : 'is-not-current'}`">
      {{ project.title }}
    </h2>
  </div>
</template>

<script>
export default {
  name: "Button",
  props: {
    project: {
      require: true,
      type: Object,
    },
    currentProject: {
      require: false,
      type: Number,
    },
  },
  data() {
    return {};
  },
  methods: {
    handleCLick() {
      this.$emit("change-index", this.project.id);
    },
  },
  mounted() {},
};
</script>

<style scoped>
.button {
  display: inline-block;
  margin-bottom: 2vw;
  z-index: 10;
  user-select: none;
}
.button__title {
  user-select: none;
  z-index: 10;
  position: relative;
  pointer-events: initial;
  font-weight: normal;
  font-size: 3vw;
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

.button__title:hover {
  color: #ff00d4;
  box-shadow: 0px 0px 30px 10px #ff00d4;
}
.button__title.is-current {
  color: #ff00d4;
  box-shadow: 0px 0px 30px 10px #ff00d4;
}

@media screen and (max-width: 900px) {
  .button__title {
    font-size: 8.5vw;
    padding: 0 4vw 0.3vw;
    margin-bottom: 4vw;
    border-radius: 6vw;
  }
}
@media screen and (max-width: 500px) {
  .button__title {
    padding: 0 5vw 0.3vw;
    border-radius: 7vw;
    margin-right: 6vw;
    margin-bottom: 4vw;
    letter-spacing: -0.4vw;
    font-size: 11vw;
    box-shadow: none;
  }
}
@-moz-document url-prefix() {
  @media screen and (max-width: 500px) {
    .button__title {
      border: 1px solid black;
    }
  }
}
</style>
