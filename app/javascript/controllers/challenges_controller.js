import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="challenges"
export default class extends Controller {
  connect() {
    console.log("Everything is fine")
  }
}
