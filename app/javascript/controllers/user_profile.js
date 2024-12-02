import { Controller } from "@hotwired/stimulus";

profileButton = document.getElementById("profileButton")

export default class extends Controller {
  profileButton.addEventListener("click", (event) {
    const file = event.target.files[0];
    if (file) {
      const reader = new FileReader();

      reader.onload = function (event) {
        // Trouver l'élément à remplacer
        const profileDiv = document.querySelector("fa-solid fa-user text-white fs-1 d-flex justify-content-center align-items-center");

        // Remplacer son contenu par une image
        profileDiv.style.backgroundImage = `url(${event.target.result})`;
        profileDiv.style.backgroundSize = "cover";
        profileDiv.style.backgroundPosition = "center";
        profileDiv.style.backgroundColor = "transparent"; // Optionnel : retire la couleur de fond
        profileDiv.innerHTML = ""; // Retire l'icône existante
      };

      reader.readAsDataURL(file);
    }
  });
}
