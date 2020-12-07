<template>
  <div class="accordeon__item-container">
    <li :class="`accordeon__item ${show ? 'is-open' : ''} `" @click="showList">
      <h3>{{ $prismic.asText(theme.data.title) }}</h3>
      <img src="~/assets/img/cross.svg" alt="toggle accordeon" class="accordeon__icon" />
    </li>
    <!-- créer un component allcard et mettre un LazyAllCards -->
    <ul class="cards" v-if="show">
      <Card
        index="0"
        title="Détruire l'Université d'André Gorz, suivi d'un commentaire/ café du commerce"
        url="https://google.com"
      />
      <Card
        index="1"
        title="Détruire l'Université d'André Gorz, suivi d'un commentaire/ café du commerce"
        url="https://google.com"
      />
      <Card
        index="2"
        title="Détruire l'Université d'André Gorz, suivi d'un commentaire/ café du commerce"
        url="https://google.com"
      />
      <Card
        index="3"
        title="Détruire l'Université d'André Gorz, suivi d'un commentaire/ café du commerce"
        url="https://google.com"
      />
    </ul>
  </div>
</template>
<script>
export default {
  props: {
    theme: {
      type: Object,
      required: true,
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
</style>
