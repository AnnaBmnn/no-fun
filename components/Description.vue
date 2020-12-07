<template>
  <section class="section">
    <p class="txt txt--big">
      {{ content }}
    </p>
  </section>
</template>
<script>
export default {
  props: {
    content: {
      type: String,
      required: false,
    },
  },
};
</script>
<style scoped>
.txt--big {
  font-size: 6vw;
  width: 85%;
}
</style>
