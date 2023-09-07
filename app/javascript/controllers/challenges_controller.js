import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    url: String,
    url2: String
  }

  static targets = ["playerIcon", "monsterIcon"]

  connect() {
    console.log(this.playerIconTarget, this.monsterIconTarget);

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
        attackSound.play();
        this.playerIconTarget.classList.add("shake-animation");

        this.monsterIconTarget.classList.add("shake-animation-reverse");

        setTimeout(() => {

          window.location.href = button.getAttribute("href");
        }, 1200);

      } else {
      enrageSound.play();
      setTimeout(() => {

        // Execute the button's original functionality (e.g., navigate or trigger some action)
        window.location.href = button.getAttribute("href"); // Example: Navigate to the link's href
      }, 5000);
      }

    // Prevent the default behavior temporarily
    event.preventDefault();
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
    }, 4000);
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
    }, 2000);
  }
}
// I need to make a comment for no reason so I can pull this branch
