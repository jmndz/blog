import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from "@rails/request.js"

// Connects to data-controller="login"
export default class extends Controller {
  async signIn(event) {
    event.preventDefault();

    const form = this.element;
    const formData = new FormData(form);
    const error = document.getElementById("loginError");

    const request = new FetchRequest("post", form.action, { 
      body: formData,
      responseKind: "json" 
    });

    const response = await request.perform();
    const data = await response.json;

    if (data.success) {
      error.classList.add("d-none");
      Turbo.visit(window.location.origin, { action: "replace" });
    } else {
      error.classList.remove("d-none");
    } 
  }
}
