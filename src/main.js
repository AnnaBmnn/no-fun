import Vue from "vue";
import VueRouter from "vue-router";
import App from "./App.vue";

Vue.config.productionTip = false;

const routes = [
  {
    path: "/",
    component: App,
    meta: {
      title: "FUN NO",
      metaTags: [
        {
          name: "description",
          content: "No fun is a (no)fun project.",
        },
        {
          property: "og:description",
          content: "No fun is a (no)fun project.",
        },
      ],
    },
  },
];

const router = new VueRouter({
  routes,
  mode: "history",
});

new Vue({
  router,
  render: (h) => h(App),
}).$mount("#app");
