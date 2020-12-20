<template>
  <div>
    <Hero
      :titleTop="$prismic.asText(homepage.title_top)"
      :titleBottom="$prismic.asText(homepage.title_bottom)"
    />
    <Description :content="$prismic.asText(homepage.content)" />
    <Section :title="$prismic.asText(homepage.title_section)">
      <Accordeon :themes="themes" :episodes="episodes" :authors="authors" />
    </Section>
  </div>
</template>

<script>
export default {
  async asyncData({ $prismic, error }) {
    try {
      // Here we query blog home content using $prismic which
      // has the api endpoint data from the nuxt.config.js
      const homepage = (await $prismic.api.getSingle("homepage")).data;
      const themes = await $prismic.api.query($prismic.predicates.at("document.type", "theme"));
      const episodes = await $prismic.api.query($prismic.predicates.at("document.type", "episod"), {
        orderings: "[my.episod.published desc]",
      });
      const authors = await $prismic.api.query($prismic.predicates.at("document.type", "author"));

      // Returns data to be used in template
      return {
        homepage,
        themes: themes.results,
        episodes: episodes.results,
        authors: authors.results,
      };
    } catch (e) {
      // Returns error page
      error({ statusCode: 404, message: "Page not found" });
    }
  },
};
</script>
