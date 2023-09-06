import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Everything is fine");
  }

  click(event) {
    const button = event.currentTarget;
    const buttons = this.element.querySelectorAll(".button, .enrage-button"); // Select buttons

    // Add the shake animation class to buttons
    buttons.forEach((btn) => {
      btn.classList.add("shake-animation");
    });

    // Prevent the default behavior temporarily
    event.preventDefault();

    // After a short delay, remove the shake animation class
    setTimeout(() => {
      buttons.forEach((btn) => {
        //sounds
        const chestSlamSound = new Audio(this.urlValue);
        chestSlamSound.play();
        //remove animation
        btn.classList.remove("shake-animation");
      });

      // Execute the button's original functionality (e.g., navigate or trigger some action)
      window.location.href = button.getAttribute("href"); // Example: Navigate to the link's href
    }, 2000);
  }
}
