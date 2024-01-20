import ApplicationController from 'controllers/application_controller'
import { addClassUnlessExist, removeClassIfExist } from 'helpers'
import { get } from '@rails/request.js'

export default class extends ApplicationController {
  static targets = ['input', 'dropdown', 'option']
  static classes = ['hide', 'chose', 'highlight']
  static values = {
    index: { type: Number, default: 0 },
    choseUrl: String,
    choseParam: { type: String, default: 'address' },
    choseTargets: {
      type: Object,
      default: {
        address1: 'address1',
        address2: 'address2',
        city: 'city',
        state: 'state',
        zip: 'zip'
      }
    }
  }

  initialize () {

  }

  show () {
    removeClassIfExist(this.dropdownTarget, this.hideClass);

    // this.dropdownTarget.focus();

    if(!this.hasOptionTarget) return;
    this.optionTarget.scrollIntoView({
      block: 'nearest'
    });
  }

  hide () {
    addClassUnlessExist(this.dropdownTarget, this.hideClass);
  }

  get showed () {
    return !this.dropdownTarget.classList.contains(this.hideClass);
  }

  clear () {
    this.inputTarget.value = '';
  }

  chooseCurrent () {
    if (!this.showed) { return }

    var index = this.indexValue
    var option = this.optionTargets[index]
    var label = option.getAttribute('data-address-label-param')
    var value = option.getAttribute('data-address-value-param')

    this.chose({ params: { value, label, index } })
  }

  chose ({ params: { value, label, index } }) {
    const params = new URLSearchParams()
    params.append(this.choseParamValue, value)
    params.append('targets', JSON.stringify(this.choseTargetsValue))
    // params.append("target_name", event.currentTarget.name)

    get(`${this.choseUrlValue}?${params}`, {
      responseKind: 'turbo-stream'
    })

    this.hide()
  }

  highlightOption (highlightedOption) {
    highlightedOption.scrollIntoView({
      block: 'nearest'
    })

    this.optionTargets.forEach((option) => {
      removeClassIfExist(option, this.highlightClass)
    })
    addClassUnlessExist(highlightedOption, this.highlightClass)
  }

  indexValueChanged () {
    if (!this.hasOptionTarget) return
    var highlightedOption = this.optionTarget

    if (!highlightedOption) return;
    this.highlightOption(highlightedOption)
  }

  get optionTarget () {
    return this.optionTargets[this.indexValue]
  }

  choseCurrent () {
    if (!this.showed) {
      this.show()
      return
    }

    var label = this.optionTarget.getAttribute('data-address-label-param')
    var value = this.optionTarget.getAttribute('data-address-value-param')
    var index = this.indexValue

    this.chose({ params: { value, label, index } })
  }

  scrollUp () {
    this.indexValue = Math.max(this.indexValue - 1, 0)
  }

  scrollDown () {
    this.indexValue = Math.min(this.indexValue + 1, this.optionTargets.length)
  }
}
