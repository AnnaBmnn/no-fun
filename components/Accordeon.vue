<template>
  <ul class="accordeon">
    <Item v-for="theme in themes" :key="theme.UID" :theme="theme" />
  </ul>
</template>
<script>
export default {
  props: {
    themes: {
      type: Array,
      required: true,
    },
  },
  methods: {},
};
</script>
<style scoped>
.accordeon {
  margin: 13vw 0;
  padding: 0;
}

.accordeon__item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  cursor: pointer;
  margin-bottom: 0.6vw;
  list-style: none;
  font-size: 8vw;
  border-top: 2px solid #020202;
  padding: 0;
}

.is-open .accordeon__icon {
  transform: rotate(45deg);
}

.is-open + .cards {
  display: flex;
}

.accordeon__item:hover {
  font-style: italic;
}

.accordeon__icon {
  margin: 0.6vw 14px;
  width: 6vw;
  height: auto;
}

.accordeon__item:last-of-type {
  border-bottom: 2px solid #020202;
}

.accordeon__item.is-open {
  border-bottom: none;
}

.is-open.accordeon__item:last-of-type + .cards {
  border-bottom: 2px solid #020202;
}

.accordeon__item h3 {
  margin: 0;
  font-size: 7vw;
}
</style>
