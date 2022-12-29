import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ["linePay", "ebPay", "MerchantOrderNo"];
  connect() {

  }
 
  btneb(){
    this.changeState(true);
    // e.peaventDefault();

    var url_string = window.location.href; 
    var url = new URL(url_string);
    const id = url.searchParams.get("room_id");
    const startTime = url.searchParams.get("start_at");
    const endTime = url.searchParams.get("end_at");
    const headcount = url.searchParams.get("headcount");

    fetch(`/bookings/ebpay?room_id=${id}&start_at=${startTime}&end_at=${endTime}&headcount=${headcount}&commit=預定行程`, {
      method: "GET"
      },)
      .then((resp) => resp.json())
      .then(({ data }) => {
        console.log(data.id);
        this.MerchantOrderNoTarget.value = data.id;
      })
      .catch(() => {
        console.log("error!!");
      });    
  }

  btnline(){ 
    this.changeState(false);
    

  }
  
  changeState(state){
    if (state){
      this.linePayTarget.classList.add('hidden')
      this.ebPayTarget.classList.remove('hidden')
      }else{
        this.linePayTarget.classList.remove('hidden')
        this.ebPayTarget.classList.add('hidden')
      }
  }
}