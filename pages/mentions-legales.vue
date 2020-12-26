<template>
  <div class="container">
    <NuxtLink to="/">→ Page d'accueil </NuxtLink>
    <h1>{{ $prismic.asText(mentions.title) }}</h1>
    <div v-html="$prismic.asHtml(mentions.content)"></div>
  </div>
</template>

<script>
export default {
  async asyncData({ $prismic, error }) {
    try {
      // Here we query blog home content using $prismic which
      // has the api endpoint data from the nuxt.config.js
      const mentions = (await $prismic.api.getSingle("mentions_legales")).data;

      // Returns data to be used in template
      return {
        mentions,
      };
    } catch (e) {
      // Returns error page
      error({ statusCode: 404, message: "Page not found" });
    }
  },
};
</script>
<style scoped>
.container {
  padding: 16px;
}
.nuxt-link-active {
  color: yellow;
}
</style>
