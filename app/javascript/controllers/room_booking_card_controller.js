import { Controller } from 'stimulus';

export default class extends Controller {

  static targets=['amount']
  connect() {
    let amount = this.amount.target.value
    
  }

  startDateChange(e){
    e.target.value
  }

  endDateChange(e){
    e.target.value
    this.amount.target.value
  }

  count_nights(start)
  
}
