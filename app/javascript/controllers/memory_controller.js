import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card"]
  static values = {
    child: String,
    game: String
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

    if (document.querySelectorAll(".card.card-revealed").length % 2 == 0) {
      if (document.querySelectorAll(".card.card-revealed")[0].classList.value === document.querySelectorAll(".card.card-revealed")[1].classList.value) {
        setTimeout(() => {
        document.querySelectorAll(".card.card-revealed")[0].classList.replace("card-revealed", "card-won")
        document.querySelectorAll(".card.card-revealed")[0].classList.replace("card-revealed", "card-won")

        if (document.querySelectorAll(".card.card-won").length == 16) {
          document.getElementById("modal-bloc").innerHTML = "<div id=\"modal-win\"><h1>Bravo !</h1><div class=\"d-flex justify-content-center mt-5 mb-5\"><div><div class=\"card one card-won\"></div></div><div class=\"d-grid\"><div class=\"d-flex\"><div class=\"mt-3\"><i class=\"fa-solid fa-star\"></i></div><div><i class=\"fa-solid fa-star\"></i></div><div class=\"mt-3\"><i class=\"fa-solid fa-star\"></i></div></div><h3 class=\"align-self-end\">XX points</h3></div></div><div class=\"d-flex justify-content-center mt-5 mb-5\"><a href=\"/children/" + this.childValue + "/games\"><i class=\"fa-solid fa-house\"></i></a><a data-turbo-method=\"post\" href=\"/children/" + this.childValue + "/games/" + this.gameValue + "/child_games\"><i class=\"fa-solid fa-rotate-right\"></i></a></div></div>"
          document.getElementById("cardboard").style.zIndex = "-3"
        }
      }, 1000);

      }
      else {
        setTimeout(() => {
          document.querySelectorAll(".card.card-revealed")[0].classList.remove("card-revealed")
          document.querySelectorAll(".card.card-revealed")[0].classList.remove("card-revealed")
        }, 1300);
      }
    }
  }
}
