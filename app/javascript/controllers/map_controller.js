import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl" // Assurez-vous que mapbox-gl est bien importé

export default class extends Controller {
  static values = {
    apiKey: String // Déclare l'apiKey pour utiliser dans le contrôleur
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

    // Lorsque la carte est chargée, ajoutez la source et le polygone
      map.on('load', () => {

        map.addSource('maine', {
          'type': 'geojson',
          'data': {
              'type': 'Feature',
              'geometry': {
                  'type': 'Polygon',
                  // These coordinates outline Maine.
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

      // Add a new layer to visualize the polygon.
      map.addLayer({
          'id': 'maine',
          'type': 'fill',
          'source': 'maine', // reference the data source
          'layout': {},
          'paint': {
              'fill-color': '#0080ff', // blue color fill
              'fill-opacity': 0.5
          }
      });
      // Add a black outline around the polygon.
      map.addLayer({
        'id': 'outline',
        'type': 'line',
        'source': 'maine',
        'layout': {},
        'paint': {
            'line-color': '#000',
            'line-width': 3
        }
      });
    //   console.log('test')
    //   // Ajout d'une source contenant des données GeoJSON pour le polygone
    //   this.map.addSource('paris', {
    //     'type': 'geojson',
    //     'data': {
    //       'type': 'Feature',
    //       'geometry': {
    //         'type': 'Polygon',
    //         'coordinates': [
    //           [
    //             [48.84959, 2.25991],
    //             [48.85184, 2.26114],
    //             [48.87603, 2.28239],
    //             [48.89292, 2.30975],
    //             [48.89802, 2.34692],
    //             [48.89895, 2.38371],
    //             [48.88232, 2.40032],
    //             [48.8481, 2.41125],
    //             [48.8296, 2.39054],
    //             [48.81924, 2.36199],
    //             [48.82251, 2.32841],
    //             [48.82941, 2.29815],
    //             [48.84959, 2.25991]
    //           ]
    //         ]
    //       }
    //     }
    //   });

    //   // Ajout de la couche pour afficher le polygone
    //   this.map.addLayer({
    //     id: 'paris',  // ID unique pour la couche
    //     type: 'fill',
    //     source: 'paris',
    //     layout: {},
    //     paint: {
    //       'fill-color': '#0080ff', // Couleur du polygone
    //       'fill-opacity': 0.5,      // Transparence du polygone
    //     }
    //   });

      // Ajouter des outils de zoom si nécessaire
      map.addControl(new mapboxgl.NavigationControl());
    });
  }
}
