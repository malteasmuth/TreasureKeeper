import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller"
export default class extends Controller {

  static targets = ["popUp", "monsterRage"];

  connect() {
    console.log("Notification");
    console.log(this.monsterRageTarget);
    console.log(this.popUpTarget);
    console.log(this.buttonTarget);

    if (this.monsterRageTarget.innerText >= 100) {
      this.openPopUp();
    }
  }

  openPopUp() {
    const popup = this.popUpTarget;
    popup.classList.add("open-popup");
  }

  closePopUp() {
    const popup = this.popUpTarget;
    popup.classList.remove("open-popup");
  }
}
