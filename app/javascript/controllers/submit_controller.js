import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['submitLoader', 'text'];

  submitLoader(e) {
    this.submitLoaderTarget.classList.remove('hidden');
    this.textTarget.textContent = '房源上傳中';
  }
}
