import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['navbar', 'navbarMenu', 'navbarCollapse', 'navbarContent']

  connect() {
    console.log("connected to navbar_dropdown");
  }

  openDropdown() {
    console.log("connected to open dropdown");
    this.navbarMenuTarget.classList.toggle('display-block');
    this.navbarContentTarget.classList.toggle('display-block');
    this.navbarTarget.classList.toggle('open-dropdown');
  }
}
