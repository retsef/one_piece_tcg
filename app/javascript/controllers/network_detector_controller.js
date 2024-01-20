import ApplicationController from 'controllers/application_controller'
import { addClassUnlessExist, removeClassIfExist } from 'helpers'

export default class extends ApplicationController {
  static targets = []
  static classes = ['hide']

  hide () {
    addClassUnlessExist(this.element, this.hideClass)
  }

  show () {
    removeClassIfExist(this.element, this.hideClass)
  }
}
