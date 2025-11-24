import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [57.5522, -20.3484], // Mauritius coordinates [lng, lat]
      zoom: 9 // Initial zoom level for Mauritius
    })

    this.map.addControl(new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl
    }))

    // Wait for map to load before adding markers
    this.map.on('load', () => {
      this.#addMarkersToMap()
      // Only fit bounds if there are markers, otherwise stay centered on Mauritius
      if (this.markersValue.length > 0) {
        this.#fitMapToMarkers()
      }
    })
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()

    // Start with Mauritius center to ensure it's included
    bounds.extend([57.5522, -20.3484])

    // Add all markers
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))

    this.map.fitBounds(bounds, {
      padding: 70,
      maxZoom: 12, // Reduced maxZoom to prevent over-zooming on small areas
      duration: 1000 // Added smooth transition
    })
  }
}
