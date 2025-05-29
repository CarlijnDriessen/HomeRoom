import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "counter"]

  connect() {
    this.update()
  }

  update() {
    const length = this.inputTarget.value.length
    this.counterTarget.textContent = `${length} / 120`

    if (length < 120) {
      this.counterTarget.classList.remove("text-success")
      this.counterTarget.classList.add("text-secondary")
    } else {
      this.counterTarget.classList.remove("text-secondary")
      this.counterTarget.classList.add("text-success")
    }
  }
}
