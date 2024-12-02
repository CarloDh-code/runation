// import { Controller } from "@hotwired/stimulus";
// const cloudinary = require('cloudinary').v2;

// import {vs as cloudinary} from "@cloudinary/url-gen";

// import {quality} from "@cloudinary/transformation-builder-sdk/actions/delivery";

// cloudinary.config({
//   cloud_name: 'dnmhbfqjc',
//   secure: true,
//   api_key: process.env.CLOUDINARY_API_KEY,
//   api_secret: process.env.CLOUDINARY_API_SECRET
// });

// (async function() {
//   const results = await cloudinary.uploader.upload('/Users/admin/code/runation/app/assets/images/photo.png');
//   console.log(results);
//   const url = cloudinary.url(results.public_id, {
//     transformation: [
//       {
//         quality: 'auto',
//         fetch_format: 'auto'
//       },

//       {
//         width: 1200,
//         height: 1200,
//         crop: 'fill',
//         gravity: 'auto'
//       }
//     ]
//   })
//   console.log(url)
// })();

//   export default class extends Controller {
//     const profileButton = document.getElementById("profileButton");
//     profileButton.addEventListener ("click", (event) => {
//     const file = event.target.files[0];
//     if (file) {
//       const reader = new FileReader();

//       reader.onload = function (event) {
//         // Trouver l'élément à remplacer
//         const profileDiv = document.querySelector("fa-solid fa-user text-white fs-1 d-flex justify-content-center align-items-center");

//         // Remplacer son contenu par une image
//         profileDiv.style.backgroundImage = `url(${event.target.result})`;
//         profileDiv.style.backgroundSize = "cover";
//         profileDiv.style.backgroundPosition = "center";
//         profileDiv.style.backgroundColor = "transparent"; // Optionnel : retire la couleur de fond
//         profileDiv.innerHTML = ""; // Retire l'icône existante
//       };

//       reader.readAsDataURL(file);
//     }
//   });
// }
