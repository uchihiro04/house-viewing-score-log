import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "url" ]
  
  copySharedUrl() {
    navigator.clipboard.writeText(this.urlTarget.value)
  }
}
