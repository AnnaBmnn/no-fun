<template>
  <div>
    <Hero
      :titleTop="$prismic.asText(homepage.title_top)"
      :titleBottom="$prismic.asText(homepage.title_bottom)"
    />
    <Description :content="$prismic.asText(homepage.content)" />
    <Section :title="$prismic.asText(homepage.title_section)">
      <Accordeon :themes="themes" />
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

      // Query to get posts content, here we also change the 'predicates' query
      const themes = await $prismic.api.query($prismic.predicates.at("document.type", "theme"));

      // Returns data to be used in template
      return {
        homepage,
        themes: themes.results,
      };
    } catch (e) {
      // Returns error page
      error({ statusCode: 404, message: "Page not found" });
    }
  },
};
</script>
