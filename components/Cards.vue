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
  width: 100vw;
  transform: translateX(-14px);
  padding: 3vw 14px calc(11vw - 20px);
  min-height: 75vh;
  display: flex;
  box-sizing: border-box;
  flex-wrap: nowrap;
  overflow-y: scroll;
  justify-content: space-between;
  cursor: grab;
}
@media screen and (max-width: 800px) {
  .cards {
    padding: 10vw 14px calc(15vw - 20px);
    min-height: 55vh;
  }
}
</style>
