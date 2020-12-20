<template>
  <ul class="accordeon">
    <Item
      v-for="theme in themes"
      :key="theme.UID"
      :theme="theme"
      :episodes="episodes.filter((episode) => episode.data.theme.id === theme.id)"
      :authors="authors.filter((author) => theme.data.author.id === author.id)"
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
    authors: {
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
