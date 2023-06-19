import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['navbar', 'navbarMenu', 'navbarCollapse', 'navbarContent']

  connect() {
    console.log("connected to navbar_dropdown");

    this.handleWindowSize();
    // window.addEventListener('resize', this.handleWindowSize.bind(this));
  }

  disconnect() {
    window.removeEventListener('resize', this.handleWindowSize.bind(this));
  }

  // handleWindowSize() {
  //   if (window.innerWidth >= 950) {
  //     console.log("connected to inner width big");
  //     this.navbarMenu.style.display = 'block';
  //     this.navbarContent.style.display = 'none';
  //   } else {
  //     console.log("connected to inner width small");
  //     this.navbarMenu.style.display = 'none';
  //     this.navbarContent.style.display = 'flex';
  //   }
  // }

  openDropdown() {
    console.log("connected to open dropdown");

    this.navbarContentTarget.style.display = 'block'
    this.navbarTarget.classList.toggle('open-dropdown');
  }
}
