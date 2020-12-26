<template>
  <ul class="list item">
    <SkewItem
      v-for="n in 100"
      :content="n % 2 == 0 ? contentNoFun : contentFun"
      :sign="n % 2 == 0 ? 1 : -1"
      class="list__item"
      :key="n"
    >
    </SkewItem>
  </ul>
</template>

<script>
import SkewItem from "./SkewItem.vue";

export default {
  name: "List",
  components: {
    SkewItem,
  },
  data() {
    return {
      contentNoFun: "no fun no fun no fun no fun no fun no fun",
      contentFun: "fun no fun no fun no fun no fun no fun",
    };
  },
  methods: {},
  mounted() {},
};
</script>

<style scoped>
.list {
  height: 100vh;
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
.list__item:nth-child(odd) {
  transform: skewX(20deg);
}
.list__item:nth-child(even) {
  transform: skewX(-20deg);
}
</style>
