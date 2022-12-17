import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = [];

  initialize() {
    this.btnState = false;
  }
  connect() {}
  wishListState(e) {
    e.preventDefault();
    console.log(123);
    if (this.btnState) {
      e.srcElement.classList.add('text-gray-500', 'opacity-80');
      e.srcElement.classList.remove('text-pink-600', 'opacity-100');
    } else {
      e.srcElement.classList.remove('text-gray-500', 'opacity-80');
      e.srcElement.classList.add('text-pink-600', 'opacity-100');
    }
    this.btnState = !this.btnState;
  }
}
