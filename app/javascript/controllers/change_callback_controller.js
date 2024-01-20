import ApplicationController from 'controllers/application_controller'
import { get } from '@rails/request.js'

export default class extends ApplicationController {
  static values = {
    url: String,
    param: { type: String, default: 'value' },
    method: { type: String, default: 'get' },
    debounce: { type: Number, default: 50 }
  }

  initialize () {
    this.propagate = this.debounce(this.propagate, this.debounceValue).bind(this)
  }

  propagate (event) {
    if (!this.urlValue) return

    const target = event.currentTarget || event.target
    const params = new URLSearchParams()
    params.append(this.paramValue, target.value)
    params.append('target_id', target.id)
    // params.append("target_name", event.currentTarget.name)

    get(`${this.urlValue}?${params}`, {
      responseKind: 'turbo-stream'
    })
  }
}
