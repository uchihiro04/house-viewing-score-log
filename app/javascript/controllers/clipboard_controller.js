import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "url" ]
  
  copyDescriptionPageUrl() {
    navigator.clipboard.writeText(this.urlTarget.value)
  }
}
