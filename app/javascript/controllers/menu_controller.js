import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["question", "sound"]

  connect() {
    console.log("controller menu is connected!");
  }

  question() {
    this.questionTarget.classList.add('active');
    var audioquestion = document.getElementById("sound-question");
    audioquestion.play();
    setTimeout(function(){
      document.querySelector('.fa-question').classList.remove('active');
    },4500);
  }

  sound() {
    if (this.soundTarget.classList.contains("back-arrow")) {
      this.soundTarget.classList.replace("back-arrow", "back-arrow-disabled")
      document.getElementById("sound-question").muted = true
      document.getElementById("sound-won").muted = true
      document.getElementById("sound-reveal").muted = true
      document.getElementById("sound-fail").muted = true
      document.getElementById("sound-victory").muted = true
      document.getElementById("sound-birds").muted = true
    }
    else {
      this.soundTarget.classList.replace("back-arrow-disabled", "back-arrow")
      document.getElementById("sound-question").muted = false
      document.getElementById("sound-won").muted = false
      document.getElementById("sound-reveal").muted = false
      document.getElementById("sound-fail").muted = false
      document.getElementById("sound-victory").muted = false
      document.getElementById("sound-birds").muted = false
    }
  }
}
