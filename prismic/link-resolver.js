export default function(doc) {
  if (doc.isBroken) {
    return "/404";
  }

  if (doc.type === "home") {
    return "/";
  }

  if (doc.type === "page") {
    return "/page/" + doc.uid;
  }

  return "/404";
}
