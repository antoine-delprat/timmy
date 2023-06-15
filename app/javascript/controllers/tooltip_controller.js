import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tooltip"
export default class extends Controller {
  connect() {
    console.log("tooltip controller is connected");
  }

  info(){
    console.log("info method triggered");
    document.getElementById('modal-info-alarm').style.display = "block";
  }
  hide(){
    console.log("hide method triggered");
    document.getElementById('modal-info-alarm').style.display = "none";
  }

  alarm() {
    var alertintro = document.getElementById("sound-alerteintro");
    alertintro.play();
    setTimeout(() => {
      var alertvoix = document.getElementById("sound-alertevoix");
      alertvoix.play();
      setTimeout(() => {
        var alertfin = document.getElementById("sound-alertefin");
        alertfin.play();
      }, 3700);
    }, 2500);
  }

}
