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
      this.openChestTarget.style.animation = "up 2.5s 1";

      // change image on drop
      setTimeout(() => {
      // Start the chest closing animation
        this.closedChestTarget.style.animation = "down 0.5s 1, shake 2s";
        this.openChestTarget.classList.add("hidden");
        this.closedChestTarget.classList.remove("hidden");
        // Play the sound
        const chestSlamSound = new Audio(this.urlValue);
        console.log(chestSlamSound.src)
        chestSlamSound.play();

      }, 2000);
    }, 2000);
  }
}
