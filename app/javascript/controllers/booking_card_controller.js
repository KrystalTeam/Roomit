import { Controller } from 'stimulus';
import dayjs from 'dayjs'

export default class extends Controller {

  static targets=['amount', "endDate", "startDate","nights"]

  connect() {
    let amount = this.amountTarget.value
    
  }
  countDates(){
    if ((this.endDateTarget.textContent !== null) && (this.startDateTarget.textContent !== null)){
    }
  }

  startDate(){
    this.countDates()
  }

  endDate(){
    this.countDates()
  }

  dateDiff(dateStart, dateEnd) {
    dayjs(dateEnd).diff(dayjs(dateStart), 'day')
  };
}
