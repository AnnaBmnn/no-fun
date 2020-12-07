export default {
  /*
   ** Headers of the page
   */
  head: {
    title: "La maison du savoir",
    meta: [
      { charset: "utf-8" },
      { name: "viewport", content: "width=device-width, initial-scale=1" },
      { hid: "description", name: "description", content: "La maison du savoir" },
    ],
    link: [
      { rel: "icon", type: "image/x-icon", href: "/favicon.ico" },
      { rel: "stylesheet", href: "https://fonts.googleapis.com/css?family=Lato:300,400,700,900" },
    ],
  },

  /*
   ** Customize the progress-bar color
   */
  loading: { color: "#fdff9b" },

  /*
   ** Global CSS
   */
  css: ["@/assets/css/main.css"],

  /*
   ** Plugins to load before mounting the App
   */
  plugins: [],

  /*
   ** Components : auto import for component
   */
  components: true,

  /*
   ** Nuxt.js modules
   */
  modules: [
    // This is where you import the plugin
    "@nuxtjs/prismic",
  ],

  // This is where you configure your settings for the new plugin
  prismic: {
    endpoint: "https://maison-du-savoir.cdn.prismic.io/api/v2",
    linkResolver: "@/prismic/link-resolver",
    htmlSerializer: "@/prismic/html-serializer",
  },

  /*
   ** Build configuration
   */
  build: {
    /*
     ** You can extend webpack config here
     */
    extend(config, ctx) {
      config.resolve.alias["vue"] = "vue/dist/vue.common";
    },
  },

  // Netlify reads a 404.html, Nuxt will load as an SPA
  generate: {
    fallback: "404.html",
  },
};
