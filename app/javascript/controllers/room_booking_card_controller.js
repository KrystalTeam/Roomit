import { Controller } from 'stimulus';

export default class extends Controller {

  static targets=['amount']

  aaa(){
    console.log(999)
  }

  connect() {
    let amount = this.amountTarget.value
    console.log(this.amountTarget.textContent);
    
  }

  startDateChange(e){
    // console.log(123);   
    this.aaa() 
  }

  // endDateChange(e){
  //   e.target.value
  //   this.amount.target.value
  // }
  
}
