// app/javascript/controllers/chest_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["openChest", "closedChest"];
  static values = {
    url: String
  }

  connect() {
    // Initial setup: Hide the closed chest.
    console.log(this.urlValue)
    // this.closedChestTarget

    // After 2 seconds, trigger the fade transition and shaking animation.
    setTimeout(() => {
      this.openChestTarget.style.animation = "up 1s 1";

      // change image on drop
      setTimeout(() => {
      // Start the chest closing animation
        this.closedChestTarget.style.animation = "down 0.5s 1, bounce 2s";
        this.openChestTarget.classList.add("hidden");
         // Play the sound
        const chestSlamSound = new Audio(this.urlValue);
        console.log("Chest slam!")
        chestSlamSound.play();
        this.closedChestTarget.classList.remove("hidden");
      }, 1000);
    }, 2000);
  }
}
