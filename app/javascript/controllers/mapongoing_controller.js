import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl";

export default class extends Controller {
  static values = {
    apiKey: String,
    layers: Array,  // Add the layers value to handle the data from the server
  }

  connect() {
    console.log("Initializing map for game", this.element.id);  // Log the map container ID
    console.log("Received layers data:", this.layersValue);


    // Set Mapbox access token
    mapboxgl.accessToken = this.apiKeyValue;

    // Extract the map container ID from this.element
    const mapId = this.element.id;  // Example: 'map-42'
    const map = new mapboxgl.Map({
      container: mapId,  // Use the unique ID for this map
      style: "mapbox://styles/mapbox/streets-v10",  // or your preferred style
      center: [2.3522, 48.8566],  // Default: center map (can be adjusted as needed)
      zoom: 12,  // Default zoom level
    });

    // Once the map is loaded, add the layers
    map.on('load', () => {
      this.addLayers(map);
    });

    map.addControl(new mapboxgl.NavigationControl());
  }

  addLayers(map) {
    // Array of colors to cycle through for each layer
    const fillColors = ['#5C96E0', '#FF5733', '#33FF57', '#FFC300', '#8E44AD', '#2980B9', '#16A085'];

    // Loop through the layers passed from the server
    this.layersValue.forEach((layerData, index) => {
      const fillColor = fillColors[index % fillColors.length];  // Select a color for each layer

      // Add the GeoJSON source for each polygon
      map.addSource(`layer-source-${index}`, {
        type: 'geojson',
        data: {
          type: 'FeatureCollection',
          features: [{
            type: 'Feature',
            geometry: {
              type: 'Polygon',
              coordinates: [layerData],
            },
          }],
        },
      });

      // Add a layer to fill the polygon with color
      map.addLayer({
        id: `layer-fill-${index}`,
        type: 'fill',
        source: `layer-source-${index}`,
        layout: {},
        paint: {
          'fill-color': fillColor,
          'fill-opacity': 0.5,  // Adjust opacity as needed
        },
      });

      // Add a layer for the polygon's outline
      map.addLayer({
        id: `layer-outline-${index}`,
        type: 'line',
        source: `layer-source-${index}`,
        layout: {},
        paint: {
          'line-color': '#000',  // Outline color
          'line-width': 2,  // Outline thickness
        },
      });
    });
  }
}
