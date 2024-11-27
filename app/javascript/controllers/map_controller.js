import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl" // Assurez-vous que mapbox-gl est bien importé

export default class extends Controller {
  static values = {
    apiKey: String,
    polylines: Array
  }

  connect() {
    // Configure Mapbox
    mapboxgl.accessToken = this.apiKeyValue;

    // Initialiser la carte centrée sur Paris
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [2.3522, 48.8566],
      zoom: 12
    });

    this.addPolylines(); // Appelle la méthode pour ajouter les polylignes
  }

  addPolylines() {
    this.polylinesValue.forEach((polyline) => {
      const coordinates = polyline.map(coord => [coord[0], coord[1]]); // Conversion si nécessaire

      // Création d'un objet GeoJSON directement au lieu d'utiliser mapboxgl.Polyline (non existant)
      const route = {
        type: 'Feature',
        geometry: {
          type: 'LineString',
          coordinates: coordinates
        }
      };

      // Ajout de la couche de polyligne à la carte
      this.map.addLayer({
        id: `route-${Math.random()}`,  // ID unique pour chaque couche
        type: 'line',
        source: {
          type: 'geojson',
          data: route
        },
        layout: {
          'line-join': 'round',
          'line-cap': 'round'
        },
        paint: {
          'line-color': '#FF5733', // Couleur de la ligne
          'line-width': 4
        }
      });
    });
  }
}
