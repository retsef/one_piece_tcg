import ApplicationController from 'controllers/application_controller'

export default class extends ApplicationController {
  static targets = []
  static classes = ['hide']

  static values = {
    timeout: { type: Number, default: 1500 }
  }

  connect () {
    this.start()
  }

  start () {
    this.timeout = setTimeout(() => this.hide(), this.timeoutValue)
  }

  stop () {
    clearTimeout(this.timeout)
  }

  restart () {
    this.stop()
    this.start()
  }

  hide () {
    this.element.classList.toggle(this.hideClass)
  }

  remove () {
    this.element.remove()
  }
}
