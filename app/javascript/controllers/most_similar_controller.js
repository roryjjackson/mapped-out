import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['profiles', 'mostSimilarProfiles', 'mostSimilarButton', 'allProfilesButton', 'mostSimilarTag']

  connect() {
    console.log("connected");
  }

  triggerMostSimilar() {
    console.log("trigger1");
    this.profilesTarget.classList.add('hidden');
    this.mostSimilarProfilesTarget.classList.add('not-hidden');
    this.mostSimilarTagTarget.classList.add('d-block')
  }

  triggerAllProfiles() {
    console.log("triggered all rpfles block");
    this.mostSimilarTagTarget.classList.remove('d-block')
    this.profilesTarget.classList.remove('hidden');
    this.mostSimilarProfilesTarget.classList.remove('not-hidden');
  }
}
