<template>
  <div class="card">
    <div class="card__index">{{ index }}</div>
    <div class="card__separator"></div>
    <h4 class="card__title">
      {{ title }}
    </h4>
    <a :href="url" class="card__link" target="_blank">→ écouter</a>
  </div>
</template>
<script>
export default {
  props: {
    index: {
      type: Number,
      required: false,
    },
    title: {
      type: String,
      required: false,
    },
    url: {
      type: String,
      required: false,
    },
  },
};
</script>
<style scoped>
.is-open.accordeon__item:last-of-type + .cards {
  border-bottom: 2px solid #020202;
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

.cards li:last-of-type {
  margin-right: 0px;
}

.card {
  height: 100%;
  position: relative;
  width: calc(33.333% - 14px);
  max-width: calc(33.333% - 14px);
  min-width: calc(33.333% - 14px);
  flex-basis: calc(33.333% - 14px);
  margin-right: 14px;
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
