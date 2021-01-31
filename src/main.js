import Vue from "vue";
import VueRouter from "vue-router";
import App from "./App.vue";

Vue.config.productionTip = false;

const routes = [
  {
    path: "/",
    component: App,
    meta: {
      title: "(NO) FUN",
      metaTags: [
        {
          name: "description",
          content: "No fun is a (no)fun project where shader experiments are posted.",
        },
        {
          property: "og:title",
          content: "(NO)FUN",
        },
        {
          property: "og:description",
          content: "No fun is a (no)fun project where shader experiments are posted.",
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
