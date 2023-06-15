import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="childview"
export default class extends Controller {
  connect() {
    console.log("childview controller is connected");
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
