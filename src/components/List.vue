<template>
  <ul class="list">
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
    <li class="list__item">no fun no fun no fun</li>
    <li class="list__item">fun fun fun fun fun</li>
  </ul>
</template>

<script>
export default {
  name: "List",
  data() {
    return {};
  },
  methods: {},
  mounted() {},
};
</script>

<style scoped>
.list {
  margin: 0;
  padding: 0;
  width: 100vw;
}
.list__item {
  margin: 0;
  list-style: none;
  font-size: 13vw;
  line-height: 0.7;
  text-transform: uppercase;
  color: #292929;
}
.list__item:nth-child(odd) {
  transform: skewX(20deg);
}
.list__item:nth-child(even) {
  transform: skewX(-20deg);
  /* color: #6d6d6d; */
  opacity: 0.8;
}
</style>
