import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    url: String,
    url2: String
  }
  connect() {
    console.log("Everything is fine");
    console.log(this.url2Value);
  }

  // treasure_chests/show/challenges/show page
  attack(event) {
    const button = event.currentTarget;
    const buttonText = event.currentTarget.innerText
    const enrageSound = new Audio(this.urlValue);
    const attackSound = new Audio(this.url2Value);

    // Add the shake animation class to buttons

      button.classList.add("shake-animation");

      if (buttonText === 'Attack!') {
        attackSound.play()
      } else {
      enrageSound.play();
      }


    // Prevent the default behavior temporarily
    event.preventDefault();

    // After a short delay, remove the shake animation class
    setTimeout(() => {

      // Execute the button's original functionality (e.g., navigate or trigger some action)
      window.location.href = button.getAttribute("href"); // Example: Navigate to the link's href
    }, 1200);
  }


  newchest(event) {
    const button = event.currentTarget;
    const coinspillSound = new Audio(this.urlValue);

    // Add the shake animation class to buttons

      button.classList.add("shake-animation");
      coinspillSound.play()

    // Prevent the default behavior temporarily
    event.preventDefault();

    // After a short delay, remove the shake animation class
    setTimeout(() => {

      // Execute the button's original functionality (e.g., navigate or trigger some action)
      window.location.href = button.getAttribute("href"); // Example: Navigate to the link's href
    }, 1200);
  }


  newquest (event) {
    const button = event.currentTarget;
    const coindropSound = new Audio(this.urlValue);

    // Add the shake animation class to buttons

      button.classList.add("shake-animation");
      coindropSound.play()

    // Prevent the default behavior temporarily
    event.preventDefault();

    // After a short delay, remove the shake animation class
    setTimeout(() => {

      // Execute the button's original functionality (e.g., navigate or trigger some action)
      window.location.href = button.getAttribute("href"); // Example: Navigate to the link's href
    }, 1200);
  }
}
