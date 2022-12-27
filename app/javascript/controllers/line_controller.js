import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ["eb"];

  connect() {
  }


  btnline(e){
    e.preventDefault();
    
    if (this.element.checked){
      this.style.display = "none"
    }

  
    const event = new CustomEvent("payline");

    document.dispatchEvent(event);

  }

}
