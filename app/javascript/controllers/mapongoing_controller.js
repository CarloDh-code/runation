import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl";

export default class extends Controller {
  static values = {
    apiKey: String,
    layers: Array // Données des couches (coordonnées, couleur, joueur)
  };

  connect() {
    console.log("Initializing map for game", this.element.id);
    console.log("Received layers data:", this.layersValue);

    // Set Mapbox access token
    mapboxgl.accessToken = this.apiKeyValue;

    // Extract the map container ID
    const mapId = this.element.id;
    const map = new mapboxgl.Map({
      container: mapId,
      style: "mapbox://styles/mapbox/streets-v11",
      center: [2.3522, 48.8566], // Centre par défaut sur Paris
      zoom: 12 // Niveau de zoom par défaut
    });

    map.addControl(new mapboxgl.NavigationControl());

    // Une fois la carte chargée, ajoute les couches
    map.on("load", () => {
      this.addLayers(map);
    });
  }

  addLayers(map) {
    this.layersValue.forEach((layerData, index) => {
      const color = layerData.color; // Couleur de la couche
      const playerName = layerData.player_name; // Nom du joueur

      // Ajouter la source GeoJSON pour chaque couche
      map.addSource(`layer-source-${index}`, {
        type: "geojson",
        data: {
          type: "FeatureCollection",
          features: [
            {
              type: "Feature",
              geometry: {
                type: "Polygon",
                coordinates: [layerData.coordinates],
                properties: {
                  playerName: playerName // Ajouter le nom du joueur aux propriétés
                }
              }
            }
          ]
        }
      });

      // Ajouter un remplissage coloré pour la couche
      map.addLayer({
        id: `layer-fill-${index}`,
        type: "fill",
        source: `layer-source-${index}`,
        layout: {},
        paint: {
          "fill-color": color,
          "fill-opacity": 0.5 // Opacité de remplissage
        }
      });

      // Ajouter une bordure pour chaque polygone
      map.addLayer({
        id: `layer-outline-${index}`,
        type: "line",
        source: `layer-source-${index}`,
        layout: {},
        paint: {
          "line-color": "#000",
          "line-width": 2
        }
      });

      // Ajouter l'interaction de clic pour afficher un popup
      map.on("click", `layer-fill-${index}`, (e) => {
        new mapboxgl.Popup()
          .setLngLat(e.lngLat)
          .setHTML(`<strong>Player:</strong> ${playerName}`)
          .addTo(map);
      });

      // Changer le curseur sur survol pour indiquer l'interactivité
      map.on("mouseenter", `layer-fill-${index}`, () => {
        map.getCanvas().style.cursor = "pointer";
      });
      map.on("mouseleave", `layer-fill-${index}`, () => {
        map.getCanvas().style.cursor = "";
      });
    });
  }
}
