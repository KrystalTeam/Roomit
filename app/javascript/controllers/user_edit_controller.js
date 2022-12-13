import { Controller } from 'stimulus';

export default class extends Controller {
<<<<<<< HEAD
  static targets = ['edit', 'save', 'editTip', 'currentSetting'];
=======
  static targets = ['edit', 'save', 'edit_tip', 'current_setting'];
>>>>>>> af6eae1 (add user edit name/email/number)

  connect() {}
  input_switch(e) {
    e.preventDefault();
    if (e.srcElement.textContent === '取消') {
<<<<<<< HEAD
      this.editTipTarget.classList.add('hidden');
      this.editTarget.classList.add('hidden');
      this.currentSettingTarget.classList.remove('hidden');
      e.srcElement.textContent = '編輯';
    } else {
      this.editTipTarget.classList.remove('hidden');
      this.editTarget.classList.remove('hidden');
      this.currentSettingTarget.classList.add('hidden');
=======
      this.edit_tipTarget.classList.add('hidden');
      this.editTarget.classList.add('hidden');
      this.current_settingTarget.classList.remove('hidden');
      e.srcElement.textContent = '編輯';
    } else {
      this.edit_tipTarget.classList.remove('hidden');
      this.editTarget.classList.remove('hidden');
      this.current_settingTarget.classList.add('hidden');
>>>>>>> af6eae1 (add user edit name/email/number)
      e.srcElement.textContent = '取消';
    }
  }
  save(e) {
<<<<<<< HEAD
    if (e.key === 'Enter') {
      e.preventDefault();
=======
    console.log(e.key);
    if (e.key === 'Enter') {
      e.preventDefault();
      console.log(this.saveTarget);
>>>>>>> af6eae1 (add user edit name/email/number)
      this.saveTarget.click();
    }
  }
}
