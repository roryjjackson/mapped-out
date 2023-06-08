// import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="chatroom-selection"
// export default class extends Controller {
//   connect() {
//     console.log("connected to chatroom selectio controller")
//   }

//   activate() {
//     console.log("clicked and actovated")
//     this.loadChatroomDetails(chatroomId);
//     console.log(chatroom)
//   }

//   loadChatroomDetails(chatroomId) {
//     const url = `/chatrooms/${chatroomId}`;
//     console.log("connected to load chatroom bit")
//     // Make an AJAX request to fetch the chatroom details partial
//     fetch(url)
//       .then(response => response.text())
//       .then(data => {
//         const chatroomDetailsElement = document.getElementById('selected-chatroom-details');
//         chatroomDetailsElement.innerHTML = data;
//       })
//       .catch(error => console.error(error));
//   }
// }
