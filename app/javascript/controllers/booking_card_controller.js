import { Controller } from 'stimulus';
import dayjs from 'dayjs';

export default class extends Controller {
  static targets = [
    'amount',
    'endDate',
    'startDate',
    'nights',
    'price',
    'total',
    'submit',
    'submitBtn',
  ];
  static values = {
    nights: Number,
    price: Number,
    amount: Number,
    dateEnd: String,
    dateStart: String,
  };

  connect() {
    this.price = Number(
      this.priceTarget.innerText
        .replace('NT', '')
        .replace('$', '')
        .replace(/(\d+),(?=\d{3}(\D|$))/g, '$1')
    );
    this.night = 1;
    this.amount = this.price * this.night;
    this.submitTarget.value = '請選擇日期';
  }

  startDate() {
    this.dateStart = this.startDateTarget.value;
    this.verifyAndChangetext();
  }

  endDate() {
    this.dateEnd = this.endDateTarget.value;
    this.verifyAndChangetext();
  }

  dateDiff(dateStart, dateEnd) {
    return dayjs(dateEnd).diff(dayjs(dateStart), 'day');
  }

  countNights() {
    this.nights = this.dateDiff(this.dateStart, this.dateEnd);
    return this.nights;
  }

  changeNightsText() {
    if (this.countNights() > 0) {
      this.nightsTarget.innerText = ` x ${this.countNights()} 晚`;
    } else {
      this.nightsTarget.value = '請重新輸入';
    }
  }

  changeAmountText(price, nights) {
    this.amount = this.price * this.nights;
    this.amountTarget.innerText = `$ ${this.numberWithCommas(this.amount)} TWD`;
  }
  changeTotalText() {
    this.totalTarget.innerText = `$ ${this.numberWithCommas(this.amount)} TWD`;
  }

  numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
  }

  enableSubmit() {
    this.submitTarget.value = '預定行程';
    this.submitBtnTarget.disabled = false;
    this.submitTarget.disabled = false;
  }

  disableSubmit() {
    this.submitTarget.value = '請輸入正確日期';
    this.submitBtnTarget.disabled = true;
    this.submitTarget.disabled = true;
  }

  verifyAndChangetext() {
    if (this.dateStart && this.dateEnd) {
      this.changeNightsText();
      if (this.countNights() > 0) {
        this.changeAmountText();
        this.changeTotalText();
        this.enableSubmit();
        this.changeBtnColorAble();
      } else {
        this.disableSubmit();
        this.changeBtnColorDisble();
      }
    }
  }

  changeBtnColorAble() {
    this.submitBtnTarget.classList.replace('text-gray-500', 'text-white');
    this.submitBtnTarget.classList.replace('btn-cancel', 'btn');
    this.submitBtnTarget.classList.add('font-bold');
  }
  changeBtnColorDisble() {
    this.submitBtnTarget.classList.replace('text-white', 'text-gray-500');
    this.submitBtnTarget.classList.replace('btn', 'btn-cancel');
    this.submitBtnTarget.classList.remove('font-bold');
  }
}
