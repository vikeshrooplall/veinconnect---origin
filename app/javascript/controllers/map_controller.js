import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

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
      style: "mapbox://styles/mapbox/streets-v11",
      center: [57.5522, -20.3484],
      zoom: 9
    })

    // Store Markers for filtering
    this.allMarkers = []

    // Add SINGLE search box (replaces Mapbox Geocoder)
    this.#addSearchBox()

    // Wait for map to load
    this.map.on('load', () => {
      this.#addMarkersToMap()
      if (this.markersValue.length > 0) {
        this.#fitMapToMarkers()
      }
    })
  }

  #addSearchBox() {
    // Create search container
    const searchContainer = document.createElement('div')
    searchContainer.className = 'search-container'
    searchContainer.innerHTML = `
      <div class="search-box">
        <input type="text"
               placeholder="Search locations..."
               class="search-input"
               data-action="input->map#handleSearch keydown.enter->map#handleEnter">
        <button class="search-clear" data-action="click->map#clearSearch">
          ×
        </button>
        <div class="search-results"></div>
      </div>
    `

    // Add to map
    this.map.getContainer().appendChild(searchContainer)

    // Store references
    this.searchInput = searchContainer.querySelector('.search-input')
    this.searchResults = searchContainer.querySelector('.search-results')
    this.clearButton = searchContainer.querySelector('.search-clear')
  }

  // Handle search input
  handleSearch() {
    const query = this.searchInput.value.trim()

    if (query.length === 0) {
      this.clearSearch()
      return
    }

    // FIRST: Search your facilities
    const searchTerm = query.toLowerCase()
    const facilityResults = this.markersValue.filter(marker => {
      return (
        marker.name.toLowerCase().includes(searchTerm) ||
        (marker.address && marker.address.toLowerCase().includes(searchTerm)) ||
        (marker.facility_type && marker.facility_type.toLowerCase().includes(searchTerm))
      )
    })

    // Display combined results
    this.#displaySearchResults(facilityResults, query)
  }

  // Handle Enter key for location search
  handleEnter(event) {
    if (event.key === 'Enter') {
      const query = this.searchInput.value.trim()
      if (query.length > 0) {
        // Try to geocode the location using Mapbox
        this.#searchLocation(query)
      }
    }
  }

  // Search for location using Mapbox API
  async #searchLocation(query) {
    try {
      const response = await fetch(
        `https://api.mapbox.com/geocoding/v5/mapbox.places/${encodeURIComponent(query)}.json?` +
        `access_token=${this.apiKeyValue}&` +
        `bbox=57.2,-20.6,57.9,-19.9&` + // Mauritius bounds
        `limit=5`
      )

      const data = await response.json()

      if (data.features && data.features.length > 0) {
        // Zoom to the first result
        const [lng, lat] = data.features[0].center
        this.map.flyTo({
          center: [lng, lat],
          zoom: 12,
          duration: 1000
        })

        // Clear search results
        this.searchResults.classList.remove('show')
      } else {
        this.searchResults.innerHTML = '<div class="no-results">Location not found in Mauritius</div>'
        this.searchResults.classList.add('show')
      }
    } catch (error) {
      console.error('Geocoding error:', error)
    }
  }

  // Clear search
  clearSearch() {
    this.searchInput.value = ''
    this.searchResults.innerHTML = ''
    this.searchResults.classList.remove('show')

    // Show all markers
    this.allMarkers.forEach(marker => marker.getElement().style.display = 'block')
  }

  #displaySearchResults(facilityResults, query) {
    if (facilityResults.length === 0) {
      // No facilities found, offer to search as location
      this.searchResults.innerHTML = `
        <div class="search-results-list">
          <div class="search-result-item location-search"
               data-action="click->map#searchAsLocation"
               data-query="${query}">
            <div class="result-name">Search for "${query}" as location</div>
            <div class="result-details">Click to search on map</div>
          </div>
        </div>
      `
      this.searchResults.classList.add('show')

      // Hide all markers when no facility results
      this.allMarkers.forEach(marker => marker.getElement().style.display = 'none')
      return
    }

    // Hide all markers first
    this.allMarkers.forEach(marker => marker.getElement().style.display = 'none')

    // Build results HTML
    let html = '<div class="search-results-list">'

    facilityResults.forEach((facility) => {
      html += `
        <div class="search-result-item facility-result"
             data-action="click->map#selectFacility"
             data-facility-lng="${facility.lng}"
             data-facility-lat="${facility.lat}">
          <div class="result-name">${facility.name}</div>
          <div class="result-details">
            ${facility.facility_type ? `<span class="result-type">${facility.facility_type}</span>` : ''}
            <span class="result-address">${facility.address || ''}</span>
          </div>
        </div>
      `

      // Show this marker
      const markerElement = this.allMarkers.find(m =>
        Math.abs(m.getLngLat().lng - facility.lng) < 0.0001 &&
        Math.abs(m.getLngLat().lat - facility.lat) < 0.0001
      )
      if (markerElement) {
        markerElement.getElement().style.display = 'block'
      }
    })

    // Add location search option at the bottom
    html += `
      <div class="search-result-item location-search"
           data-action="click->map#searchAsLocation"
           data-query="${query}">
        <div class="result-name">Search for "${query}" as location</div>
        <div class="result-details">Not finding what you need? Search on map</div>
      </div>
    `

    html += '</div>'
    this.searchResults.innerHTML = html
    this.searchResults.classList.add('show')
  }

  // Select a facility from search results
  selectFacility(event) {
    const lng = parseFloat(event.currentTarget.dataset.facilityLng)
    const lat = parseFloat(event.currentTarget.dataset.facilityLat)

    const marker = this.allMarkers.find(m =>
      Math.abs(m.getLngLat().lng - lng) < 0.0001 &&
      Math.abs(m.getLngLat().lat - lat) < 0.0001
    )

    if (marker) {
      this.map.flyTo({
        center: [lng, lat],
        zoom: 14,
        duration: 1000
      })

      setTimeout(() => {
        marker.togglePopup()
      }, 500)

      this.searchResults.classList.remove('show')
    }
  }

  // Search as location
  searchAsLocation(event) {
    const query = event.currentTarget.dataset.query
    this.#searchLocation(query)
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      const mapboxMarker = new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)

      this.allMarkers.push(mapboxMarker)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([57.5522, -20.3484])
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, {
      padding: 70,
      maxZoom: 15,
      duration: 1000
    })
  }
}
