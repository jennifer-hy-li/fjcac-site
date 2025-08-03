let index = 0;
const images = document.querySelectorAll(".carousel-image");
const nextBtn = document.querySelector(".carousel-btn.next");
const prevBtn = document.querySelector(".carousel-btn.prev");

function showSlide(i) {
  images.forEach((img, idx) => img.classList.toggle("active", idx === i));
}

nextBtn.addEventListener("click", () => {
  index = (index + 1) % images.length;
  showSlide(index);
});

prevBtn.addEventListener("click", () => {
  index = (index - 1 + images.length) % images.length;
  showSlide(index);
});

// auto-play (optional)
setInterval(() => {
  index = (index + 1) % images.length;
  showSlide(index);
}, 5000);
