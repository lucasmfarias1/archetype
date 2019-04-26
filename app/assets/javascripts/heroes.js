const deleteHero = (id) => {
  let deletedHero = document.querySelector('#hero-' + id);
  deletedHero.parentNode.removeChild(deletedHero);
}