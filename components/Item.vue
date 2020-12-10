<template>
  <li
    class="accordeon__item-container"
    :aria-label="`ouvrir les épisode du thème ${$prismic.asText(theme.data.title)}`"
  >
    <button :class="`accordeon__item ${show ? 'is-open' : ''} `" @click="showList">
      <h3>{{ $prismic.asText(theme.data.title) }}</h3>
      <img
        src="~/assets/img/cross.svg"
        alt="toggle accordeon"
        width="6vw"
        height="6vw"
        class="accordeon__icon"
      />
    </button>
    <Cards v-if="show" :episodes="episodes" />
  </li>
</template>
<script>
export default {
  props: {
    theme: {
      type: Object,
      required: true,
    },
    episodes: {
      type: Array,
      required: false,
    },
  },
  data() {
    return {
      show: false,
    };
  },
  methods: {
    showList() {
      this.show = !this.show;
    },
  },
};
</script>
<style scoped>
.accordeon__item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  cursor: pointer;
  margin-bottom: 0.6vw;
  list-style: none;
  font-size: 8vw;
  border-top: 2px solid #020202;
  padding: 0;
}

.is-open .accordeon__icon {
  transform: rotate(45deg);
}

.accordeon__item:hover {
  font-style: italic;
}

.accordeon__icon {
  margin: 0.6vw 14px;
  width: 6vw;
  height: auto;
}

.accordeon__item h3 {
  margin: 0;
  font-size: 7vw;
}
.accordeon__item.is-open {
  border-bottom: none;
}

.accordeon__item-container:last-of-type .accordeon__item {
  border-bottom: 2px solid #020202;
}
.accordeon__item-container:last-of-type .is-open.accordeon__item + .cards {
  border-bottom: 2px solid #020202;
}
.accordeon__item-container:last-of-type .is-open.accordeon__item {
  border-bottom: none;
}
@media screen and (max-width: 800px) {
  .accordeon__item {
    align-items: flex-start;
    text-align: left;
  }
  .accordeon__item h3 {
    font-size: 10vw;
  }
  .accordeon__icon {
    margin: 2.5vw 0px 0.6vw 14px;
    width: 8vw;
  }
}
</style>
