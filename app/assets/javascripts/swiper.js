$(function() {
  new Swiper('.swiper-container', {
  // Optional parameters
    // direction: 'vertical',
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

  // If we need pagination
    pagination: {
      el: '.swiper-pagination',
    },

  // Navigation arrows
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },

  // And if we need_rollbar
    scrollbar: {
      el: '.swiper-scrollbar',
    },
  })
})