import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  transitionUrl(event) {
    const url = event.currentTarget.dataset['href']
    window.location.href = url
  }
}
