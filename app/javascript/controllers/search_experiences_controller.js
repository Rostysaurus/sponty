import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "input", "list"]

  connect() {
    // console.log("hi")
    // console.log(this.formTarget)
    // console.log(this.inputTarget)
  }
  update() {
    const input = this.inputTarget.value
    if (this.inputTarget.value !== "") {
      console.log(this.inputTarget.value)
      const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
      // console.log(this.inputTarget.value)
      fetch(url, { headers: { "Accept": "text/plain" } })
        .then(response => response.text())
        .then((data) => {
          console.log(data);
          this.listTarget.innerHTML = data;
        })
    } else {
      this.listTarget.innerHTML = ""
    }
  }
}
