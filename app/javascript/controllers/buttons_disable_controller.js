import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="buttons-disable"
export default class extends Controller {
  connect() {

    console.log("Hello from buttons-disable");
  }
}
