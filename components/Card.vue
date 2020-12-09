<template>
  <div class="card">
    <div class="card__index">
      {{ showIndex }}
    </div>
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
    themeId: {
      type: String,
      required: false,
    },
    publishedAt: {
      type: String,
      required: false,
    },
  },
  computed: {
    showIndex: function() {
      // X8Y6JXIAACKAKZZD
      if (this.themeId === "X8Y6jxIAACkAkzzd") {
        const date = Intl.DateTimeFormat("fr-FR", {
          year: "numeric",
          month: "2-digit",
          day: "2-digit",
        }).format(new Date(this.publishedAt));
        console.log(date);
        return date;
      } else {
        return this.index < 10 ? "0" + this.index : this.index;
      }
    },
  },
};
</script>
<style scoped>
.card {
  height: 100%;
  position: relative;
  width: calc(30% - 14px);
  max-width: calc(30% - 14px);
  min-width: calc(30% - 14px);
  flex-basis: calc(30% - 14px);
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
@media screen and (max-width: 800px) {
}
@media screen and (max-width: 500px) {
  .card {
    width: calc(75% - 14px);
    max-width: calc(75% - 14px);
    min-width: calc(75% - 14px);
    flex-basis: calc(75% - 14px);
  }
  .card__title {
    margin: 8px 0 21vw;
    font-size: 6vw;
    max-width: 90%;
    line-height: 1.1;
  }
  .card__index {
    font-size: 7vw;
  }
  .card__link {
    font-size: 5vw;
  }
}
</style>
