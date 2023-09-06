import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller"
export default class extends Controller {

  static targets = ["popUp", "monsterRage", "status", "h2", "p"];

  connect() {
    console.log(this.statusTarget.innerText);
    if (this.monsterRageTarget.innerText >= 100) {
      this.openPopUp();
    }

    if (this.statusTarget.innerText == "won") {
      this.winPopUp();
    }
  }

  openPopUp() {
    const popup = this.popUpTarget;
    popup.classList.remove("d-none");
    popup.classList.add("popup-red");
    setTimeout(() =>{
      popup.classList.add("open-popup-start")
    }, 1000)
  }

  winPopUp() {
    const popup = this.popUpTarget;
    popup.classList.remove("d-none");
    popup.classList.add("popup-green");
    this.h2Target.innerText = "You beat the monster";
    this.pTarget.innerText = "Now loot the corpse and fill your chest with teasure!";
    setTimeout(() =>{
      popup.classList.add("open-popup-start")
    }, 1000)
  }

  closePopUp() {
    const popup = this.popUpTarget;
    popup.classList.remove("open-popup-start");
  }
}
