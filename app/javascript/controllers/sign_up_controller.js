import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from "@rails/request.js"

// Connects to data-controller="sign-up"
export default class extends Controller {
  async createAccount() {
    const form = this.element;
    const formData = new FormData(form);
    const error = document.getElementById("signUpError");

    const request = new FetchRequest("post", form.action, { 
      body: formData,
      responseKind: "json" 
    });

    const response = await request.perform();
    const data = await response.json;

    if (data.success) {
      error.classList.add("d-none");
      location.reload();
    } else {
      error.classList.remove("d-none");
    } 
  }

  validateForm(event) {
    event.preventDefault();
    event.stopPropagation();

    const form = this.element;

    if (!(form.checkValidity() && this.emailValidation(form) && this.passwordValidation(form))){
      this.emailValidation(form);
      this.passwordValidation(form);
    } else {
      this.createAccount();
    }
  }

  emailValidation(form) {
    const email = form.querySelector('input#user_email'),
          regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/,
          emailError = form.querySelector("#emailError");

    if (regex.test(email.value)) {
      emailError.classList.add("d-none");
    } else {
      emailError.classList.remove("d-none");
    }

    return regex.test(email.value);
  }

  passwordValidation(form) {
    const password = form.querySelector('input#user_password'),
          passwordConfirmation = form.querySelector('input#user_password_confirmation'),
          passwordError = form.querySelector("#passwordError"),
          passwordConfirmationError = form.querySelector("#passwordConfirmationError");

    if (password.value === passwordConfirmation.value && password.value.length >= 8) {
      passwordError.classList.add("d-none");
      passwordConfirmationError.classList.add("d-none");
    } else {
      if (password.value.length >= 8) {
        passwordError.classList.add("d-none");
      } else {
        passwordError.classList.remove("d-none");
      } 

      if (password.value === passwordConfirmation.value) {
        passwordConfirmationError.classList.add("d-none");
      } else {
        passwordConfirmationError.classList.remove("d-none");
      }
    }

    return password.value === passwordConfirmation.value && password.value.length >= 8;
  }
}
