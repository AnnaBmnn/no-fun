<template>
  <li class="list__item">
    {{ content }}
  </li>
</template>

<script>
export default {
  name: "SkewItem",
  props: {
    content: {
      required: true,
      type: String,
    },
  },
  data() {},
  methods: {},
};
</script>

<style scoped>
.list {
  height: 500vh;
  overflow: hidden;
  margin: 0;
  padding: 0;
  width: 100vw;
}
.list__item {
  margin: 0;
  list-style: none;
  font-size: 24vh;
  line-height: 0.7;
  text-transform: uppercase;
  color: black;
}
</style>
