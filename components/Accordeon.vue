<template>
  <ul class="accordeon">
    <Item
      v-for="theme in themes"
      :key="theme.UID"
      :theme="theme"
      :episodes="episodes.filter((episode) => episode.data.theme.id === theme.id)"
    />
  </ul>
</template>
<script>
export default {
  props: {
    themes: {
      type: Array,
      required: true,
    },
    episodes: {
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
</style>
