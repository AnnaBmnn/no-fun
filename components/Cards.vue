<template>
  <ul class="cards">
    <Card
      v-for="(episode, index) in episodes"
      :key="episode.id"
      :index="episodes.length - index"
      :title="$prismic.asText(episode.data.title)"
      :url="episode.data.record.url"
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
  width: 100%;
  padding: 3vw 0 calc(11vw - 20px);
  min-height: 75vh;
  display: flex;
  box-sizing: border-box;
  flex-wrap: nowrap;
  overflow-y: scroll;
  justify-content: space-between;
}
</style>
