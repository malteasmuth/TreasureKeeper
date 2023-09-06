import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="health"
export default class extends Controller {

  static targets = ["popUp", "health", "h2", "p"];

  connect() {
    console.log(this.healthTarget.innerText);

    if (this.healthTarget.innerText <= 0) {
      this.openPopUp();
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

}
