import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slider"
export default class extends Controller {
  static targets = ["budget"]

  connect() {
    // console.log("I am such a noodle")
    // console.log(this.budgetTarget)
  }

  updateBudget(event){
    // console.log(event.currentTarget.value)
    this.budgetTarget.innerText = event.currentTarget.value;
  }
}
