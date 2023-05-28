import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets= ['profiles', 'mostSimilarProfiles']

  connect() {
    console.log("connected")
  }

  trigger() {

    this.profilesTarget.classList.toggle('hidden')
    this.mostSimilarProfilesTarget.classList.toggle('not-hidden')
  }
}
