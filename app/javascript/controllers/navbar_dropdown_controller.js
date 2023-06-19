import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['navbar', 'navbarBars', 'navbarCollapse']

  connect() {
    console.log("connected to navbar_dropdown");
  }

  openDropdown() {
    console.log("connected to open dropdown");
    this.navbarBarsTarget.innerHTML = 'close';
    this.navbarTarget.classList.toggle('navbar-collapse-open');
  }
}
