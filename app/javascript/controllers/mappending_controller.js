import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl" // Assurez-vous que mapbox-gl est bien importé

export default class extends Controller {
  static values = {
    apiKey: String
  }

  connect() {
    // Configure Mapbox
    console.log("hello");
    mapboxgl.accessToken = this.apiKeyValue;

    // Initialiser la carte centrée sur Paris
    const map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [2.3522, 48.8566], // Paris
      zoom: 12
    });

    // Coordonnées pour "maine"
    const maineCoords = [
      [2.25991, 48.84959],
      [2.26114, 48.85184],
      [2.28239, 48.87603],
      [2.30975, 48.89292],
      [2.34692, 48.89802],
      [2.38371, 48.89895],
      [2.40032, 48.88232],
      [2.41125, 48.8481],
      [2.39054, 48.8296],
      [2.36199, 48.81924],
      [2.32841, 48.82251],
      [2.29815, 48.82941],
      [2.25991, 48.84959]
    ];

    // Lorsque la carte est chargée, ajoutez les sources et le polygone pour "maine"
    map.on('load', () => {
      // Ajout de la source pour "maine"
      map.addSource('maine', {
        'type': 'geojson',
        'data': {
          'type': 'Feature',
          'geometry': {
            'type': 'Polygon',
            'coordinates': [maineCoords]
          }
        }
      });

      // Ajout du contour de "maine"
      map.addLayer({
        'id': 'maine-outline',
        'type': 'line',
        'source': 'maine',
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
