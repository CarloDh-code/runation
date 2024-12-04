import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl"; // Assurez-vous que mapbox-gl est bien importé

export default class extends Controller {
  static values = {
    apiKey: String,
    centroid: String, // Récupérer les coordonnées du centroid
    coordinates: String // Récupérer les coordonnées du polygone
  }

  connect() {
    console.log("Carte connectée pour l'id:", this.element.id);
    mapboxgl.accessToken = this.apiKeyValue;

    // Récupérer les coordonnées du polygone et le centroid
    const centroid = JSON.parse(this.centroidValue); // Le centroid est un objet avec latitude et longitude
    const coordinates = JSON.parse(this.coordinatesValue); // Le polygone est un tableau de coordonnées

    // Initialiser la carte centrée sur le centroid
    const map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [centroid.latitude, centroid.longitude], // Inverser la latitude et la longitude ici
      zoom: 10
    });

    // Lorsque la carte est chargée, ajoutez les sources et le polygone
    map.on('load', () => {
      // Ajout de la source pour le polygone
      map.addSource(this.element.id, {
        'type': 'geojson',
        'data': {
          'type': 'Feature',
          'geometry': {
            'type': 'Polygon',
            'coordinates': [coordinates] // Ajouter les coordonnées du polygone
          }
        }
      });

      // Ajout du contour du polygone
      map.addLayer({
        'id': `${this.element.id}-outline`,
        'type': 'line',
        'source': this.element.id,
        'layout': {},
        'paint': {
          'line-color': '#000',  // Noir pour le contour
          'line-width': 4
        }
      });

      // Ajout des contrôles de navigation
      map.addControl(new mapboxgl.NavigationControl());
    });
  }

  randomColor() {
    // Génère une couleur aléatoire au format hexadécimal
    return '#' + Math.floor(Math.random() * 16777215).toString(16);
  }
}
