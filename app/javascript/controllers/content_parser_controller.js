import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="content-parser"
export default class extends Controller {
  connect() {
    this.element.querySelectorAll("div.toVideoTag").forEach(async element => {
      const src = element.getAttribute('src');
      const video_tag = document.createElement('video');
      
      const response = await fetch(src);
      const blob = await response.blob();
      const object_url = URL.createObjectURL(blob);
      
      video_tag.src = object_url;
      video_tag.controls = "controls";
      video_tag.classList.add("d-block", "w-100", "mx-auto", "my-3");

      element.after(video_tag);
      element.remove() ;
    })
  }
}
