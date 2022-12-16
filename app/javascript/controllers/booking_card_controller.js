import { Controller } from 'stimulus';
import dayjs from 'dayjs'

export default class extends Controller {

  static targets=['amount', "endDate", "startDate","nights"]

  connect() {
    let amount = this.amountTarget.value
    console.log(this.amountTarget.textContent);
    
  }
  countDates(){
    console.log('123')
    if ((this.endDateTarget.textContent !== null) && (this.startDateTarget.textContent !== null)){
      console.log(this.dateDiff(this.endDateTarget.textContent, this.startDateTarget.textContent))
    }
  }

  startDate(){
    console.log(this.startDateTarget.value)
    this.countDates()
  }

  endDate(){
    console.log(`${this.endDateTarget.value},${this.startDateTarget.value}`)
    this.countDates()
  }

  dateDiff(dateStart, dateEnd) {
    dayjs(dateEnd).diff(dayjs(dateStart), 'day')
  };
}
