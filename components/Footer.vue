<template>
  <footer class="footer">
    <nav>
      <ul>
        <li>
          <span class="footer__emoji">☻</span> Fonts : Radio Grotesk par
          <a
            alt="site de pangram pangram, foundry"
            class="footer__link"
            href="https://pangrampangram.com/"
            ><span class="footer__link-content">Pangram Pangram</span>
            <span class="footer__hover">☻</span></a
          >
        </li>
        <li>
          <span class="footer__emoji">☺︎</span> Design + Code :
          <a
            alt="instagram de Anna Baumann"
            class="footer__link"
            href="https://www.instagram.com/bannabmnn.cyber/"
            ><span class="footer__link-content">Anna Baumann</span>
            <span class="footer__hover">☺︎</span></a
          >
        </li>
      </ul>
    </nav>
  </footer>
</template>
<script></script>
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
}
</style>
