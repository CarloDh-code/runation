import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl";

export default class extends Controller {
  static values = {
    apiKey: String,
    layers: Array, // Données des couches (coordonnées, couleur, joueur)
    centroid: Object,
    coordinateLayer: Array // Coordonnées du contour du jeu
  };

  connect() {
    console.log("Initializing map for game", this.element.id);
    console.log("Received layers data:", this.layersValue);
    console.log("Received game boundary coordinates:", this.coordinateLayerValue);

    // Set Mapbox access token
    mapboxgl.accessToken = this.apiKeyValue;


    // Extract the map container ID
    const mapId = this.element.id;
    const options = {
      container: mapId,
      center: [this.centroidValue.latitude, this.centroidValue.longitude], // Centre par défaut sur Paris
      zoom: 10 // Niveau de zoom par défaut
    }
    if (window.location.pathname == '/games/mine'){
      console.log('truc')
      options.interactive = false
    }
    const map = new mapboxgl.Map(options);

    map.addControl(new mapboxgl.NavigationControl());

    // Une fois la carte chargée, ajoute les couches
    map.on("load", () => {
      this.addLayers(map);
      this.addGameBoundary(map); // Ajouter le contour du jeu
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
          .setHTML(`<strong>Owned by</strong> ${playerName}`)
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

  // Nouvelle méthode pour ajouter le contour du jeu
  addGameBoundary(map) {
    if (this.coordinateLayerValue && this.coordinateLayerValue.length > 0) {
      map.addSource("game-boundary", {
        type: "geojson",
        data: {
          type: "FeatureCollection",
          features: [
            {
              type: "Feature",
              geometry: {
                type: "Polygon",
                coordinates: [this.coordinateLayerValue] // Utilise les coordonnées du jeu
              }
            }
          ]
        }
      });

      // Ajouter une bordure pour le contour du jeu sans remplissage
      map.addLayer({
        id: "game-boundary-outline",
        type: "line",
        source: "game-boundary",
        layout: {},
        paint: {
          "line-color": "rgb(0, 45, 128)", // Couleur bleue foncée pour la bordure
          "line-width": 3 // Largeur de la bordure
        }
      });
    }
  }
}
