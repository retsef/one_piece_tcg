import { Turbo } from '@hotwired/turbo'
const StreamActions = Turbo.StreamActions

const camelize = (value) => value.replace(/(?:[_-])([a-z0-9])/g, (_, char) => char.toUpperCase())
const tokenize = (value) => value ? value.match(/[^\s]+/g) || [] : []
const typecast = (value) => {
  try {
    return JSON.parse(value)
  } catch (e) {
    return value
  }
}

StreamActions.add_css_class = function () {
  const classes = tokenize(this.getAttribute('classes'))

  if (classes.length > 0) {
    this.targetElements.forEach((element) => element.classList.add(...classes))
  }
}

StreamActions.remove_attribute = function () {
  const attribute = this.getAttribute('attribute')

  if (attribute) {
    this.targetElements.forEach((element) => element.removeAttribute(attribute))
  }
}

StreamActions.remove_css_class = function () {
  const classes = tokenize(this.getAttribute('classes'))

  if (classes.length > 0) {
    this.targetElements.forEach((element) => element.classList.remove(...classes))
  }
}

StreamActions.set_attribute = function () {
  const attribute = this.getAttribute('attribute')
  const value = this.getAttribute('value') || ''

  if (attribute) {
    this.targetElements.forEach((element) => element.setAttribute(attribute, value))
  }
}

StreamActions.set_dataset_attribute = function () {
  const attribute = this.getAttribute('attribute')
  const value = this.getAttribute('value') || ''

  if (attribute) {
    this.targetElements.forEach((element) => (element.dataset[camelize(attribute)] = value))
  }
}

StreamActions.set_property = function () {
  const name = this.getAttribute('name')
  const value = typecast(this.getAttribute('value') || '')

  if (name) {
    this.targetElements.forEach((element) => (element[name] = value))
  }
}

StreamActions.set_style = function () {
  const name = this.getAttribute('name')
  const value = this.getAttribute('value') || ''

  if (name) {
    this.targetElements.forEach((element) => (element.style[name] = value))
  }
}

StreamActions.set_styles = function () {
  const styles = this.getAttribute('styles') || ''

  this.targetElements.forEach((element) => element.setAttribute('style', styles))
}

StreamActions.set_value = function () {
  const value = this.getAttribute('value') || ''

  this.targetElements.forEach((element) => (element.value = value))
}

StreamActions.toggle_css_class = function () {
  const classes = tokenize(this.getAttribute('classes'))

  if (classes.length > 0) {
    this.targetElements.forEach((element) => {
      classes.forEach((className) => element.classList.toggle(className))
    })
  }
}
