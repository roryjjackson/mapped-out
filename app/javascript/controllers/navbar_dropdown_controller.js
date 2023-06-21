import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['navbar', 'navbarContent', 'navbarFluid']

  connect() {
    console.log("connected to navbar_dropdown");
  }

  openDropdown() {
    console.log("connected to open dropdown");
    this.navbarFluidTarget.classList.toggle('display-dropdown');
    this.navbarContentTarget.classList.toggle('display-block');
    // this.navbarTarget.classList.toggle('open-dropdown');
  }
}
