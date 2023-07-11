import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  createLink(event) {
    const link = event.currentTarget.dataset['href']
    window.location.href = link
  }
}
