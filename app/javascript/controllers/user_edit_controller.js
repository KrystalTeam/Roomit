import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['edit', 'save', 'editTip', 'currentSetting', 'phone_num', 'errorMessages'];

  connect() {}
  setEditStatus(state) {
    if (state) {
      this.editTipTarget.classList.add('hidden');
      this.editTarget.classList.add('hidden');
      this.currentSettingTarget.classList.remove('hidden');
    } else {
      this.editTipTarget.classList.remove('hidden');
      this.editTarget.classList.remove('hidden');
      this.currentSettingTarget.classList.add('hidden');
    }
  }
  input_switch(e) {
    e.preventDefault();
    if (e.srcElement.textContent === '取消') {
      e.srcElement.textContent = '編輯';
      this.setEditStatus(true);
    } else {
      e.srcElement.textContent = '取消';
      this.setEditStatus(false);
    }
  }
  save(e) {
    if (e.key === 'Enter') {
      e.preventDefault();
      this.saveTarget.click();
    }
  }


  validatePhoneNum(e){
    const regex = /(\d{2,3}-?|(\d{2,3}))\d{3,4}-?\d{4}|09\d{2}(\d{6}|-\d{3}-\d{3})/
    if (regex.test(this.phone_numTarget.value)){
      this.errorMessagesTarget.innerText = ''
    }else{
      e.preventDefault();
      this.errorMessagesTarget.innerText = '請輸入正確電話號碼'
    }
  }
}
