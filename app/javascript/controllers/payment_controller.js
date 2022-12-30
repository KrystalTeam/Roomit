import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ["linePay", "ebPay", "MerchantID", "MerchantOrderNo", "TradeInfo", "TradeSha", "TimeStamp","Version", "RespondType", "Amt", "ItemDesc", "Email", "LoginType"];
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
      })
      .then((resp) => resp.json())
      .then(({ data, form_info, info }) => {
        // console.log(info.MerchantOrderNo);
        this.MerchantIDTarget.value = form_info.MerchantID;
        this.TradeInfoTarget.value = form_info.TradeInfo;
        this.TradeShaTarget.value = form_info.TradeSha;

        this.MerchantOrderNoTarget.value = info.MerchantOrderNo;
        this.TimeStampTarget.value = info.TimeStamp;
        this.VersionTarget.value = info.Version;
        this.RespondTypeTarget.value = info.RespondType;
        this.AmtTarget.value = info.Amt;
        this.ItemDescTarget.value = info.ItemDesc;
        this.EmailTarget.value = info.Email;
        this.LoginTypeTarget.value = info.LoginType       
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