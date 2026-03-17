import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="back-button"
export default class extends Controller {
  static targets = ["link"];
  connect() {
  }

  redirectBack() {
    history.back();
  }
}