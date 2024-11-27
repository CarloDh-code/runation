import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
  }

  connect() {
    // Configure Mapbox
    mapboxgl.accessToken = this.apiKeyValue

    // Initialiser la carte centré sur Paris
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [2.3522, 48.8566], // Coordonnées de Paris
      zoom: 12,
    })

    // Ajouter les marqueurs
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat]) // Utilise lng (longitude) et lat (latitude)
        .addTo(this.map)
    })
  }
}
