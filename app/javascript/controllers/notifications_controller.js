import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller"
export default class extends Controller {

  static targets = ["popUp", "monsterRage", "status", "h2", "p", 'popupbtn'];

  connect() {
    console.log(this.statusTarget.innerText);
    console.log(this.popupbtnTarget);
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
    this.h2Target.innerText = "YOU BEAT THE MONSTER";
    this.pTarget.innerText = "Plunder the body, fill your chest with treasure!";
    this.popupbtnTarget.classList.add('pop-up-win')
    setTimeout(() =>{
      popup.classList.add("open-popup-start")
    }, 1000)
  }

  closePopUp() {
    const popup = this.popUpTarget;
    popup.classList.remove("open-popup-start");
  }
}
