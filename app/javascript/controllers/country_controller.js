import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="country"
export default class extends Controller {
  connect() {
  }

  change(event) {
    const selectedCountry = event.target.selectedOptions[0].value ? event.target.selectedOptions[0].value : nil;
    const url = `/customers/states?&country=${selectedCountry}`;
    fetch(url, {
      headers: { accept: "text/vnd.turbo-stream.html" }
    })
    .then(response => response.text())
    .then(html => Turbo.renderStreamMessage(html))
  }
}
