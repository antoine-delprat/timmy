import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card"]

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
          document.getElementById("cardboard").innerHTML = "<img src='https://i0.wp.com/www.blog-les-dauphins.com/wp-content/uploads/2014/04/dauphin_captif.jpg'>"
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
