import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("connected to update mentor controller")
  }

  updateMentorStatus() {
    const userId = this.data.get('userId');
    const csrfToken = document.querySelector('[name="csrf-token"]').content;


    fetch(`/users/${userId}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken
      },
      body: JSON.stringify({mentor: true})
    })

    .then(resp => resp.json())
    .then(data => {

    })
    .catch(error => {

    });
  }
}
