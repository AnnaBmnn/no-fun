<template>
  <div>
    <Nuxt />
    <Footer :footer="homepage.data.footer" />
  </div>
</template>
<script>
export default {
  async fetch() {
    this.homepage = await this.$prismic.api.getSingle("homepage");
  },
  data() {
    return {
      homepage: {},
    };
  },
};
</script>
