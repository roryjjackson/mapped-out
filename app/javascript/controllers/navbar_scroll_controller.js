import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['navbar'];

  connect() {
    this.prevScrollPos = window.pageYOffset;
    this.navbarHeight = this.navbarTarget.offsetHeight;

    window.addEventListener('scroll', this.handleScroll.bind(this));
  }

  disconnect() {
    window.removeEventListener('scroll', this.handleScroll);
  }

  handleScroll() {
    const currentScrollPos = window.pageYOffset;
    const scrollingUp = currentScrollPos < this.prevScrollPos;

    if (scrollingUp) {
      this.navbarTarget.classList.remove('hidden');
    } else {
      this.navbarTarget.classList.add(`hidden`);
    }

    this.prevScrollPos = currentScrollPos;
  }
}
