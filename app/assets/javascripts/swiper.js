$(function() {
  new Swiper('.swiper-container', {
    loop: true,
    grabCursor: true,
    effect: 'coverflow',
    centeredSlides: true,
    slidesPerView: 1,
    speed: 1000,
    breakpoints: {
      1024: {
        slidesPerView: 2,
      }
    },
    autoplay: {
      delay: 4000,
      disableOnInteraction: false
    },
    pagination: {
      el: '.swiper-pagination',
    },
  })
})