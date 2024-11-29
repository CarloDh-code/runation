import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl" // Assurez-vous que mapbox-gl est bien importé

export default class extends Controller {
  static values = {
    apiKey: String // Déclare l'apiKey pour utiliser dans le contrôleur
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

    // Coordonnées supplémentaires
    const sevenCoords = [
      [2.297047, 48.861093],
      [2.314303, 48.856918],
      [2.316581, 48.849105],
      [2.310304, 48.845493],
      [2.296665, 48.844626],
      [2.287592, 48.847402],
      [2.289194, 48.857352],
      [2.297047, 48.861093]
    ];

    const elevenCoords = [
      [2.370202, 48.863731],
      [2.380478, 48.865396],
      [2.388082, 48.861637],
      [2.386295, 48.856508],
      [2.379265, 48.853111],
      [2.367259, 48.852016],
      [2.360066, 48.854948],
      [2.357709, 48.859620],
      [2.363169, 48.864248],
      [2.370202, 48.863731]
    ];

    // Lorsque la carte est chargée, ajoutez les sources et les polygones
    map.on('load', () => {
      // Ajout de la première source (maine)
      map.addSource('maine', {
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

      // Ajout de la source et du polygone pour sevenCoords
      map.addSource('seven', {
        'type': 'geojson',
        'data': {
          'type': 'Feature',
          'geometry': {
            'type': 'Polygon',
            'coordinates': [sevenCoords]
          }
        }
      });

      // Ajout de la source et du polygone pour elevenCoords
      map.addSource('eleven', {
        'type': 'geojson',
        'data': {
          'type': 'Feature',
          'geometry': {
            'type': 'Polygon',
            'coordinates': [elevenCoords]
          }
        }
      });

     

      map.addLayer({
        'id': 'maine-outline',
        'type': 'line',
        'source': 'maine',
        'layout': {},
        'paint': {
          'line-color': '#000',
          'line-width': 3
        }
      });

      map.addLayer({
        'id': 'seven',
        'type': 'fill',
        'source': 'seven',
        'layout': {},
        'paint': {
          'fill-color': '#FAB95B', // Jaune pour sevenCoords
          'fill-opacity': 0.5
        }
      });

      map.addLayer({
        'id': 'seven-outline',
        'type': 'line',
        'source': 'seven',
        'layout': {},
        'paint': {
          'line-color': '#F5564E', // Orange pour le contour
          'line-width': 3
        }
      });

      map.addLayer({
        'id': 'eleven',
        'type': 'fill',
        'source': 'eleven',
        'layout': {},
        'paint': {
          'fill-color': '#5C96E0', // Bleu clair pour elevenCoords
          'fill-opacity': 0.5
        }
      });

      map.addLayer({
        'id': 'eleven-outline',
        'type': 'line',
        'source': 'eleven',
        'layout': {},
        'paint': {
          'line-color': '#002D80', // Bleu foncé pour le contour
          'line-width': 3
        }
      });

      // Ajout des contrôles de navigation
      map.addControl(new mapboxgl.NavigationControl());
    });
  }
}
