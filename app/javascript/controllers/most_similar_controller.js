import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets= ['profiles', 'mostSimilarProfiles', 'buttonagain']

  connect() {
    console.log("connected")
  }

  trigger() {
    console.log("trigger1")
    this.profilesTarget.classList.toggle('hidden')
    this.mostSimilarProfilesTarget.classList.toggle('not-hidden')
    this.buttonagainTarget.classList.toggle('hidden')
    // this.buttonTarget.classList.toggle('hidden')
  }

  triggeragain() {
    console.log('triggeragain')
  }
}
