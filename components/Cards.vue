<template>
  <ul class="cards">
    <Card
      v-for="(episode, index) in episodes"
      :key="episode.id"
      :index="episodes.length - index"
      :title="$prismic.asText(episode.data.title)"
      :url="episode.data.record.url"
      :themeId="episode.data.theme.id"
      :publishedAt="episode.data.published"
    />
  </ul>
</template>
<script>
export default {
  props: {
    episodes: {
      type: Array,
      required: false,
    },
  },
};
</script>
<style scoped>
.cards {
  width: calc(100% + 32px);
  transform: translateX(-16px);
  padding: 3vw 14px calc(11vw - 20px);
  min-height: 70vh;
  display: flex;
  box-sizing: border-box;
  flex-wrap: nowrap;
  overflow-x: auto;
  overflow-y: hidden;
  justify-content: space-between;
  scrollbar-width: thin;
  scrollbar-color: rgba(0, 0, 0, 0.6) transparent;
}
@media screen and (max-width: 800px) {
  .cards {
    padding: 10vw 14px calc(15vw - 20px);
    min-height: 55vh;
  }
}
</style>
