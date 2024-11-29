import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl" // Assurez-vous que mapbox-gl est bien importé

export default class extends Controller {
  static values = {
    apiKey: String,
    mapLayers: Array
  }

  connect() {
    // Configure Mapbox
    console.log("hello")
    mapboxgl.accessToken = this.apiKeyValue;

    // Initialiser la carte centrée sur Paris
    const map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [2.3522, 48.8566], // Paris
      zoom: 12
    });

    // Ajouter des contrôles de navigation
    map.addControl(new mapboxgl.NavigationControl());

    // Lorsque la carte est chargée, ajoutez les layers
    map.on('load', () => {

      // Ajouter chaque layer pour chaque ensemble de coordonnées passé via `this.mapLayersValue`
      this.mapLayersValue.forEach((layer, index) => {
        map.addLayer({
          'id': `layer-${index}`, // ID unique pour chaque layer
          'type': 'fill',
          'source': {
            'type': 'geojson',
            'data': {
              'type': 'Feature',
              'geometry': {
                'type': 'Polygon',
                'coordinates': [layer] // Assurez-vous que c'est un tableau de tableaux
              }
            }
          },
          'layout': {},
          'paint': {
            'fill-color': this.randomColor(), // Couleur aléatoire pour chaque layer
            'fill-opacity': 0.5
          }
        });
      });

      // Exemple supplémentaire : Ajouter un layer fixe (Maine) avec une source GeoJSON
      map.addSource('paris', {
        'type': 'geojson',
        'data': {
          'type': 'Feature',
          'geometry': {
            'type': 'Polygon',
            'coordinates': [
              [
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
              ]
            ]
          }
        }
      });

      // Add a new layer to visualize the polygon (Maine)
      map.addLayer({
        'id': 'paris',
        'type': 'fill',
        'source': 'paris', // reference the data source
        'layout': {},
        'paint': {
          'fill-color': '#0080ff', // blue color fill
          'fill-opacity': 0.5
        }
      });

      // Add a black outline around the polygon (Maine)
      map.addLayer({
        'id': 'outline',
        'type': 'line',
        'source': 'paris',
        'layout': {},
        'paint': {
          'line-color': '#F5564E',
          'line-width': 4
        }
      });
    });
  }

  randomColor() {
    // Génère une couleur aléatoire au format hexadécimal
    return '#' + Math.floor(Math.random() * 16777215).toString(16);
  }
}
