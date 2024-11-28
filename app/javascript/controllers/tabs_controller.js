document.addEventListener("DOMContentLoaded", () => {

  console.log("JavaScript chargé et prêt !");

  const tabLinks = document.querySelectorAll(".tab-link");
  const tabContents = document.querySelectorAll(".tab-content");

  // Activer le premier onglet par défaut
  if (tabLinks.length > 0) {
    tabLinks[0].classList.add("active");
    const firstTabContent = document.querySelector(tabLinks[0].getAttribute("data-target"));
    if (firstTabContent) {
      firstTabContent.classList.add("active");
      firstTabContent.style.display = "block";
    }
  }

  tabLinks.forEach((link) => {
    link.addEventListener("click", (event) => {
      event.preventDefault(); // Empêche la navigation par défaut

      // Réinitialise tous les onglets
      tabLinks.forEach((l) => l.classList.remove("active"));
      tabContents.forEach((content) => {
        content.classList.remove("active");
        content.style.display = "none";
      });

      // Active l'onglet cliqué
      link.classList.add("active");
      const target = document.querySelector(link.getAttribute("data-target"));
      if (target) {
        target.classList.add("active");
        target.style.display = "block";
      }
    });
  });
});

