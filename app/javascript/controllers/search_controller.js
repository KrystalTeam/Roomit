import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['addressField'];
  connect() {
  }
  fillText(e){
    if (e.target.nodeName === 'SPAN'){
      this.addressFieldTarget.value = e.target.innerText
    }
  }
}
