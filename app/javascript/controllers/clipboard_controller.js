import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "source" ]
  
  copyDescriptionPageUrl() {
    navigator.clipboard.writeText(this.sourceTarget.value)
  }
}
