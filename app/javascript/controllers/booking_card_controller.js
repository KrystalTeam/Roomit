import { Controller } from 'stimulus';
import dayjs from 'dayjs'

export default class extends Controller {

  static targets = ['amount', 'endDate', 'startDate', 'nights', 'price', 'total']
  static values = {
    nights: Number,
    price: Number,
    amount: Number,
    dateEnd: String,
    dateStart: String,
  }

  connect() {
    this.price = Number(this.priceTarget.innerText.replace('$','').replace('NT','').replace(/(\d+),(?=\d{3}(\D|$))/g, "$1"))
    this.night = 1
    this.amount = this.price * this.night
  }

  startDate(){
    this.dateStart = this.startDateTarget.value
    if ((this.dateStart) && (this.dateEnd)){
      this.changeNightsText()
      if(this.countNights() > 0){
        this.changeAmountText()
        this.changeTotalText()        
      }
    }
  }

  endDate(){
    this.dateEnd = this.endDateTarget.value
    if ((this.dateStart) && (this.dateEnd)){
      this.changeNightsText()
      if(this.countNights() > 0){
        this.changeAmountText()
        this.changeTotalText()        
      }
    }
  }

  dateDiff(dateStart, dateEnd) {
    return dayjs(dateEnd).diff(dayjs(dateStart), 'day')
  };

  countNights(){
    this.nights = this.dateDiff(this.dateStart, this.dateEnd)
    return this.nights
  }

  changeNightsText(){
    if (this.countNights() > 0 ){
      this.nightsTarget.innerText = ` x ${this.countNights()} 晚`
    }else{
      this.nightsTarget.innerText = '請重新輸入'
    }
  }

  changeAmountText(price,nights){
    this.amount = this.price * this.nights
    this.amountTarget.innerText = `$ ${this.numberWithCommas(this.amount)} TWD`
  }
  changeTotalText(){
    this.totalTarget.innerText = `$ ${this.numberWithCommas(this.amount)} TWD`
  }

  numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }
}