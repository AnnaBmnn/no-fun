<template>
  <ul class="accordeon">
    <li v-for="theme in themes" :key="theme.UID" class="accordeon__item js-toggle-accordeon">
      <h3>{{ $prismic.asText(theme.data.title) }}</h3>
      <img src="~/assets/img/cross.svg" alt="toggle accordeon" class="accordeon__icon" />
    </li>
    <li class="accordeon__item js-toggle-accordeon">
      <h3>marx(ismes)</h3>
      <img src="~/assets/img/cross.svg" alt="toggle accordeon" class="accordeon__icon" />
    </li>
    <ul class="cards">
      <li>
        <card class="card">
          <div class="card__index">06</div>
          <div class="card__separator"></div>
          <h4 class="card__title">
            "Détruire l'Université" d'André Gorz, suivi d'un commentaire/ café du commerce
          </h4>
          <a
            href="whttps://soundcloud.com/user-339671041/marxismes-6detruire-luniversite-dandre-gorz-suivi-dun-commentairecafe-du-commerce"
            class="card__link"
            target="_blank"
            >→ écouter</a
          >
        </card>
      </li>
      <li>
        <card class="card">
          <div class="card__index">05</div>
          <div class="card__separator"></div>
          <h4 class="card__title">Dystopies réelles du revenu de base</h4>
          <a
            href="https://soundcloud.com/user-339671041/marxismes-5-dystopies-reelles-du-revenu-de-base?in=user-339671041/sets/marx-ismes-par-ivan-recio"
            class="card__link"
            target="_blank"
            >→ écouter</a
          >
        </card>
      </li>
      <li>
        <card class="card">
          <div class="card__index">04</div>
          <div class="card__separator"></div>
          <h4 class="card__title">Le Mythe du revenu de base inconditionnel</h4>
          <a
            href="https://soundcloud.com/user-339671041/marxismes-4le-mythe-du-revenu-de-base-inconditionnel?in=user-339671041/sets/marx-ismes-par-ivan-recio"
            class="card__link"
            target="_blank"
            >→ écouter</a
          >
        </card>
      </li>
      <li>
        <card class="card">
          <div class="card__index">03</div>
          <div class="card__separator"></div>
          <h4 class="card__title">Castoriadis et sa critique du marxisme</h4>
          <a
            href="https://soundcloud.com/user-339671041/marxismes3-castoriadis-et-sa-critique-du-marxisme?in=user-339671041/sets/marx-ismes-par-ivan-recio"
            class="card__link"
            target="_blank"
            >→ écouter</a
          >
        </card>
      </li>
      <li>
        <card class="card">
          <div class="card__index">02</div>
          <div class="card__separator"></div>
          <h4 class="card__title">
            Critique de la valeur en France et introduction à Castoriadis
          </h4>
          <a
            href="https://soundcloud.com/user-339671041/marxismes2critique-de-la-valeur-en-france-et-introduction-a-castoriadis?in=user-339671041/sets/marx-ismes-par-ivan-recio"
            class="card__link"
            target="_blank"
            >→ écouter</a
          >
        </card>
      </li>
      <li>
        <card class="card">
          <div class="card__index">01</div>
          <div class="card__separator"></div>
          <h4 class="card__title">Introduction</h4>
          <a
            href="https://soundcloud.com/user-339671041/marxismes1introduction?in=user-339671041/sets/marx-ismes-par-ivan-recio"
            class="card__link"
            target="_blank"
            >→ écouter</a
          >
        </card>
      </li>
    </ul>
  </ul>
</template>
<script>
export default {
  props: {
    themes: {
      type: Array,
      required: true,
    },
  },
};
</script>
<style scoped>
.accordeon {
  margin: 13vw 0;
  padding: 0;
}

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

.is-open + .cards {
  display: flex;
}

.accordeon__item:hover {
  font-style: italic;
}

.accordeon__icon {
  margin: 0.6vw 14px;
  width: 6vw;
  height: auto;
}

.accordeon__item:last-of-type {
  border-bottom: 2px solid #020202;
}

.accordeon__item.is-open {
  border-bottom: none;
}

.is-open.accordeon__item:last-of-type + .cards {
  border-bottom: 2px solid #020202;
}

.accordeon__item h3 {
  margin: 0;
  font-size: 7vw;
}

.cards {
  width: 100%;
  padding: 3vw 0 calc(11vw - 20px);
  min-height: 75vh;
  box-sizing: border-box;
  display: none;
  flex-wrap: nowrap;
  overflow: auto;
  justify-content: space-between;
  /* padding-bottom: 20px; */
}

.cards li {
  width: calc(33.333% - 14px);
  max-width: calc(33.333% - 14px);
  min-width: calc(33.333% - 14px);
  flex-basis: calc(33.333% - 14px);
  margin-right: 14px;
}

.cards li:last-of-type {
  margin-right: 0px;
}

.card {
  height: 100%;
  position: relative;
}

.card__index {
  font-size: 3.5vw;
  margin-bottom: 8px;
}

.card__separator {
  width: 100%;
  height: 2px;
  background-color: #020202;
}

.card__title {
  margin: 16px 0 8vw;
  font-weight: 400;
  font-size: 2.5vw;
  letter-spacing: 1px;
  width: 95%;
}

.card__link {
  font-size: 2.2vw;
  color: #020202;
  position: absolute;
  bottom: 0;
}

.card__link:hover {
  font-style: italic;
}
</style>
