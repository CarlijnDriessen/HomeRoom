import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement"]

  connect() {
    // Set initial tab based on data attribute
    this.showTab(this.data.get("initialTab") || "guest")
  }

  fire(event) {
    // Toggle between guest and host
    const isHost = event.target.checked
    this.showTab(isHost ? "host" : "guest")
  }

  showTab(tab) {
    if (this.togglableElementTargets.length !== 2) return
    // Assume: [0] = Host, [1] = Guest
    if (tab === "host") {
      this.togglableElementTargets[0].classList.remove("d-none")
      this.togglableElementTargets[1].classList.add("d-none")
      document.getElementById("toggle").checked = true
    } else {
      this.togglableElementTargets[0].classList.add("d-none")
      this.togglableElementTargets[1].classList.remove("d-none")
      document.getElementById("toggle").checked = false
    }
  }
}
