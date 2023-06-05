import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['navbar'];

  connect() {
    console.log('wahey')
    this.prevScrollPos = window.pageYOffset;
    // this.navbarHeight = this.navbarTarget.offsetHeight;

    window.addEventListener('scroll', this.handleScroll.bind(this));
  }

  disconnect() {
    window.removeEventListener('scroll', this.handleScroll);
  }

  handleScroll() {
    console.log("gdsigefpiu")
    const currentScrollPos = window.pageYOffset;
    const scrollingUp = currentScrollPos < this.prevScrollPos;

    // if (window.pageYOffset < 0) {
    //   this.navbarTarget.classList.add('non-transparent');
    // } else {
    //   this.navbarTarget.classList.remove('non-transparent');
    // }

    if (scrollingUp) {
      this.navbarTarget.classList.remove('hidden');
    } else {
      this.navbarTarget.classList.add(`hidden`);
    }

    this.prevScrollPos = currentScrollPos;
  }
}
