import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller"
export default class extends Controller {

  static targets = ["popUp", "monsterRage", "status"];

  connect() {
    console.log(this.statusTarget.innerText);
    if (this.monsterRageTarget.innerText >= 100) {
      this.openPopUp();
    }

    if (this.statusTarget.innerText == "won"){
      this.openWonPopUp();
    }
  }

  openPopUp() {
    const popup = this.popUpTarget;
    popup.classList.remove("d-none");
    setTimeout(() =>{
      popup.classList.add("open-popup-start")
    }, 1000)
  }

  closePopUp() {
    const popup = this.popUpTarget;
    popup.classList.remove("open-popup-start");
  }

  openWonPopUp() {
    const popup = this.popUpTarget;
    popup.classList.remove("d-none");
    setTimeout(() =>{
      popup.classList.add("open-popup-start")
    }, 1000)
  }
}
