import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ["chooseebpay"];

  connect() {
    
  }


  btneb(e){
    e.preventDefault();
    // if (this.chooseebpayTarget.checked){
      // this.submitebTarget.style.display = "none"
    // }
  
    const event = new CustomEvent("payeb");

    document.dispatchEvent(event);

  }

}

