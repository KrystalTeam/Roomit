import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = [];

  connect() {
    console.log('123');
  }
  wishList(e) {
    e.preventDefault();
    console.log('444');
  }
}
