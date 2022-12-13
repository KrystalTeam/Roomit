import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['edit', 'save', 'edit_tip', 'current_setting'];

  connect() {}
  input_switch(e) {
    e.preventDefault();
    if (e.srcElement.textContent === '取消') {
      this.edit_tipTarget.classList.add('hidden');
      this.editTarget.classList.add('hidden');
      this.current_settingTarget.classList.remove('hidden');
      e.srcElement.textContent = '編輯';
    } else {
      this.edit_tipTarget.classList.remove('hidden');
      this.editTarget.classList.remove('hidden');
      this.current_settingTarget.classList.add('hidden');
      e.srcElement.textContent = '取消';
    }
  }
  save(e) {
    console.log(e.key);
    if (e.key === 'Enter') {
      e.preventDefault();
      console.log(this.saveTarget);
      this.saveTarget.click();
    }
  }
}
