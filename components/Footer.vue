<template>
  <footer class="footer">
    <nav>
      <ul>
        <li v-for="(item, index) in footer" :key="index">
          <span class="footer__emoji">☺︎</span>
          {{ $prismic.asText(item.label) }}
          <a
            alt="site de pangram pangram, foundry"
            class="footer__link"
            target="_blank"
            :href="item.link.url"
            ><span class="footer__link-content">{{ $prismic.asText(item.link_content) }}</span>
            <span class="footer__hover">☻</span></a
          >
        </li>
      </ul>
    </nav>
  </footer>
</template>
<script>
export default {
  props: {
    footer: {
      type: Array,
      required: true,
    },
  },
};
</script>
<style scoped>
.footer {
  margin: 48vh 16px 46vh;
  font-size: 0.9rem;
  display: flex;
  align-items: center;
}
.footer__emoji {
  font-size: 1.3rem;
}
.footer__link {
  color: black;
  text-decoration: none;
}
.footer__link-content {
  color: black;
  text-decoration: underline;
}
.footer__link .footer__hover {
  display: inline-block;
  font-size: 1.3rem;
  text-decoration: none;
  opacity: 0;
  transform: rotateZ(-180deg) translateX(-1px) translateY(-6px);
  text-decoration: none;
  opacity: 0;
}
.footer__link:hover .footer__hover {
  opacity: 1;
}
@media screen and (max-width: 800px) {
  .footer {
    font-size: 0.8rem;
    margin: 45vh 10px 44vh;
  }
  .footer__emoji {
    transform: translateY(3px);
  }
}
</style>
