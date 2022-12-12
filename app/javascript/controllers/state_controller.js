import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="state"
export default class extends Controller {
  connect() {
  }

  change(event) {
    const selectedState = event.target.selectedOptions[0].value;
    const url = `/customers/cities?&state=${selectedState}`;
    fetch(url, {
      headers: { accept: "text/vnd.turbo-stream.html" }
    })
    .then(response => response.text())
    .then(html => Turbo.renderStreamMessage(html))
  }
}
