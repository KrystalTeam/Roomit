import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['edit', 'save', 'editTip', 'currentSetting'];

  connect() {}
  input_switch(e) {
    e.preventDefault();
    if (e.srcElement.textContent === '取消') {
      this.editTipTarget.classList.add('hidden');
      this.editTarget.classList.add('hidden');
      this.currentSettingTarget.classList.remove('hidden');
      e.srcElement.textContent = '編輯';
    } else {
      this.editTipTarget.classList.remove('hidden');
      this.editTarget.classList.remove('hidden');
      this.currentSettingTarget.classList.add('hidden');
      e.srcElement.textContent = '取消';
    }
  }
  save(e) {
    if (e.key === 'Enter') {
      e.preventDefault();
      this.saveTarget.click();
    }
  }
}
