import { Controller } from "@hotwired/stimulus";
import debounce from "debounce";

// Connects to data-controller="search"
export default class extends Controller {
  initialize() {
    // console.log("initialize");
    // this.perform = debounce(this.perform.bind(this), 300);
  }
  perform() { 
    this.element.requestSubmit();
  }
}
