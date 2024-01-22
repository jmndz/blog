import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="feedback"
export default class extends Controller {
  connect() {
    const textArea = this.element.querySelector("#feedback_body");
    const submitBtn = this.element.querySelector("input[type='submit']");

    textArea.addEventListener("input", () => {
      if(textArea.value.trim() !== "") {
        submitBtn.classList.remove("disabled");
      } else {
        submitBtn.classList.add("disabled");
      }
    });
  }
}
