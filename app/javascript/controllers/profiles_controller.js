import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profiles"
export default class extends Controller {
  static targets = ['profiles', 'mostSimilarProfiles'];

  connect() {
    console.log('Most Similar Controller connected!');
    window.addEventListener('click', this.trigger.bind(this));
  }

  disconnect() {
    window.removeEventListener('click', this.trigger);
  }

  trigger() {
    const profilesContainer = this.profilesTarget;
    const mostSimilarContainer = this.mostSimilarProfilesTarget;

    profilesContainer.classList.toggle('hidden');
    mostSimilarContainer.classList.toggle('hidden');
  }
}
