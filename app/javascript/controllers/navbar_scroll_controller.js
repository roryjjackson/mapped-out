import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['navbar'];

  connect() {
    this.prevScrollPos = window.pageYOffset;

    window.addEventListener('scroll', this.handleScroll.bind(this));
  }

  disconnect() {
    window.removeEventListener('scroll', this.handleScroll);
  }

  handleScroll() {
    const currentScrollPos = window.pageYOffset;
    const scrollingDown = currentScrollPos > this.prevScrollPos;
    const scrollDifference = Math.abs(currentScrollPos - this.prevScrollPos);


    if (scrollingDown && scrollDifference > 10) {
      this.navbarTarget.classList.remove('hidden');
    } else {
      this.navbarTarget.classList.add(`hidden`);
    }

    this.prevScrollPos = currentScrollPos;
  }
}
