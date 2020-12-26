<template>
  <li ref="skewElement" class="list__item">
    {{ content }}
  </li>
</template>

<script>
import { gsap } from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

gsap.registerPlugin(ScrollTrigger);
export default {
  name: "SkewItem",
  props: {
    sign: {
      required: true,
      type: Number,
    },
    content: {
      required: true,
      type: String,
    },
  },
  data() {
    return {
      skewBase: 20,
    };
  },
  methods: {},
  mounted() {
    let proxy = { skew: 0 },
      skewSetter = gsap.quickSetter(this.$refs.skewElement, "skewX", "deg"), // fast
      clamp = gsap.utils.clamp(-80, 80); // don't let the skew go beyond 20 degrees.

    ScrollTrigger.create({
      scrub: true,
      onUpdate: (self) => {
        console.log(self.getVelocity());
        let skew = clamp(
          this.skewBase * this.sign + Math.abs(self.getVelocity() * 0.01) * this.sign
        );
        // only do something if the skew is MORE severe. Remember, we're always tweening back to 0, so if the user slows their scrolling quickly, it's more natural to just let the tween handle that smoothly rather than jumping to the smaller skew.
        if (Math.abs(skew) > Math.abs(proxy.skew)) {
          proxy.skew = skew;
          gsap.to(proxy, {
            skew: this.sign * this.skewBase,
            translateX: self.getVelocity() + "px",
            duration: 3,
            ease: "power3",
            overwrite: true,
            onUpdate: () => skewSetter(proxy.skew),
          });
        }
      },
    });
  },
};
</script>

<style scoped>
.list {
  height: 500vh;
  overflow: hidden;
  margin: 0;
  padding: 0;
  width: 100vw;
}
.list__item {
  margin: 0;
  list-style: none;
  font-size: 24vh;
  line-height: 0.7;
  text-transform: uppercase;
  color: black;
}
.list__item:nth-child(odd) {
  /* transform: skewX(20deg); */
}
.list__item:nth-child(even) {
  /* transform: skewX(-20deg); */
}
</style>
