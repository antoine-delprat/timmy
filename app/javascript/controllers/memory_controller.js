import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card"]
  static values = {
    child: String,
    game: String,
    childgame: String
  }

  connect() {
    console.log("controller memory is connected!");

    const cards = ['one', 'one', 'two', 'two', 'three', 'three', 'four', 'four', 'five', 'five', 'six', 'six', 'seven', 'seven', 'eight', 'eight']
    const shuffleArray = (array) => {
      for (var i = array.length - 1; i > 0; i--) {
          var j = Math.floor(Math.random() * (i + 1));
          var temp = array[i];
          array[i] = array[j];
          array[j] = temp;
      }
      return array
    }
    let randomCards = shuffleArray(cards)
    this.cardTargets.forEach((target) => {
      target.classList.add(randomCards[0])
      randomCards.splice(0, 1)
    })

    var audiobirds = document.getElementById("sound-birds");
    audiobirds.loop = true;
    audiobirds.play();
  }

  reveal(event) {
    // au clic sur une image, on ajoute la class 'card-revealed'
      // si une seule carte a été cliquée (càd a la class 'card-revealed')
        // => il ne se passe rien
      // si deux cartes ont été cliquées (càd ont la class 'card-revealed')
        // => on compare leurs classes respectives
          // si elles ont les mêmes, on leur remplace la class 'card-revealed' par 'card-won>'
            // puis on vérifie si le jeu est fini, càd si toutes les cartes ont la classe 'card-won>'
          // si elles n'ont pas les mêmes, on attend 2 secondes avant de leur retirer la class 'card-revealed'

    event.target.classList.add("card-revealed")

    if (document.querySelectorAll(".card.card-revealed").length % 2 !== 0) {
      var audioreveal = document.getElementById("sound-reveal");
      audioreveal.play();
    }
    if (document.querySelectorAll(".card.card-revealed").length % 2 == 0) {
      var noclick = function(e) {
        e.classList.add('no-click');
      }
      var okclick = function(e) {
        e.classList.remove('no-click');
      }

      document.querySelectorAll(".card").forEach(element => noclick(element));

      if (document.querySelectorAll(".card.card-revealed")[0].classList.value === document.querySelectorAll(".card.card-revealed")[1].classList.value) {
        var audiowon = document.getElementById("sound-won");
        audiowon.play();

        var animateCard = function(e) {
          e[0].classList.add('animate', 'zoomcard');
          e[1].classList.add('animate', 'zoomcard');
          setTimeout(function(){
            e[0].classList.remove('animate', 'zoomcard');
            e[1].classList.remove('animate', 'zoomcard');
          },700);
        };
        animateCard(document.querySelectorAll(".card.card-revealed"))

        setTimeout(() => {
          document.querySelectorAll(".card.card-revealed")[0].classList.replace("card-revealed", "card-won")
          document.querySelectorAll(".card.card-revealed")[0].classList.replace("card-revealed", "card-won")

          if (document.querySelectorAll(".card.card-won").length == 16) {
            document.getElementById("cardboard").classList.add("shake");
            var audiovictory = document.getElementById("sound-victory");
            audiovictory.play();

            document.getElementById("modal-bloc").innerHTML = "<div id=\"modal-win\"><h1>Bravo !</h1><div class=\"d-flex justify-content-center mt-5 mb-5\"><div><div class=\"card two card-won\"></div></div><div class=\"d-grid\"><div class=\"d-flex\"><div class=\"mt-3\"><i class=\"fa-solid fa-star\"></i></div><div><i class=\"fa-solid fa-star\"></i></div><div class=\"mt-3\"><i class=\"fa-solid fa-star\"></i></div></div><h3 class=\"align-self-end\">+ 10 points</h3></div></div><div class=\"d-flex justify-content-center mt-5 mb-5\"><a data-turbo-method=\"patch\" href=\"/children/" + this.childValue + "/games/" + this.gameValue + "/child_games/" + this.childgameValue + "?link=games\"><i class=\"fa-solid fa-house\"></i></a><a data-turbo-method=\"patch\" href=\"/children/" + this.childValue + "/games/" + this.gameValue + "/child_games/" + this.childgameValue + "?link=newgame\"><i class=\"fa-solid fa-rotate-right\"></i></a></div></div>"
            document.getElementById("cardboard").style.zIndex = "-3"
          }
          document.querySelectorAll(".card").forEach(element => okclick(element));
        }, 1000);
      }
      else {
        var audiofail = document.getElementById("sound-fail");
        audiofail.play();
        document.querySelectorAll(".card.card-revealed")[0].classList.add("shake")
        document.querySelectorAll(".card.card-revealed")[1].classList.add("shake")
        setTimeout(() => {
          document.querySelectorAll(".card.card-revealed")[0].classList.remove("card-revealed", "shake")
          document.querySelectorAll(".card.card-revealed")[0].classList.remove("card-revealed", "shake")
          document.querySelectorAll(".card").forEach(element => okclick(element));
        }, 1300);
      }


    }
  }
}


// document.getElementById("modal-bloc").innerHTML = "<div id=\"modal-win\"><h1>Bravo !</h1><div class=\"d-flex justify-content-center mt-5 mb-5\"><div><div class=\"card two card-won\"></div></div><div class=\"d-grid\"><div class=\"d-flex\"><div class=\"mt-3\"><i class=\"fa-solid fa-star\"></i></div><div><i class=\"fa-solid fa-star\"></i></div><div class=\"mt-3\"><i class=\"fa-solid fa-star\"></i></div></div><h3 class=\"align-self-end\">+ 10 points</h3></div></div><div class=\"d-flex justify-content-center mt-5 mb-5\"><a href=\"/children/" + this.childValue + "/games\"><i class=\"fa-solid fa-house\"></i></a><a data-turbo-method=\"post\" href=\"/children/" + this.childValue + "/games/" + this.gameValue + "/child_games\"><i class=\"fa-solid fa-rotate-right\"></i></a></div></div>"
