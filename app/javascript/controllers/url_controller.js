import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  transitionToUrl(event) {
    const url = event.currentTarget.dataset['href']
    window.location.href = url
  }
}
