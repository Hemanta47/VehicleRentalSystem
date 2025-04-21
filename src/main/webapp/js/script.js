//Slider
const slider = document.querySelector('.slide-items');
const slides = document.querySelectorAll('.slide');
const dots = document.querySelectorAll('.dots li');

let active = 0;
let interval;

function goToSlide(index) {
	const slideWidth = slides[0].offsetWidth;
	slider.style.transform = `translateX(-${slideWidth * index}px)`;
	dots.forEach(dot => dot.classList.remove('active'));
	dots[index].classList.add('active');
	active = index;
}

dots.forEach((dot, index) => {
	dot.addEventListener('click', () => {
		goToSlide(index);
		resetAutoplay();
	});
});

function autoPlay() {
	active = (active + 1) % slides.length;
	goToSlide(active);
}

function startAutoplay() {
	interval = setInterval(autoPlay, 4000);
}

function resetAutoplay() {
	clearInterval(interval);
	startAutoplay();
}

goToSlide(active);
startAutoplay();

