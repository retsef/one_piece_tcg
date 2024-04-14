import ApplicationController from 'controllers/application_controller'
import 'howler'

export default class extends ApplicationController {
  static targets = []
  static values = {
    src: String,
    volume: { type: Number, default: 0.5 },
    initial: Boolean
  }

  sound = null

  connect () {
    if (this.hasInitialValue) this.play()
  }

  play () {
    if (!this.srcValue) return

    this.sound = new window.Howl({
      src: [this.srcValue],
      autoplay: true,
      loop: false,
      volume: this.volumeValue,
      onplay: this.onPlay.bind(this),
      onend: this.onEnd.bind(this),
    })
  }

  stop () {
    if (!this.sound) return

    this.sound.stop()
  }

  onPlay () {
    this.element.dispatchEvent(new CustomEvent('audio:play', { bubbles: true, cancelable: true }))
  }

  onEnd () {
    this.element.dispatchEvent(new CustomEvent('audio:end', { bubbles: true, cancelable: true }))
  }

  disconnect () {
    this.stop()

    this.sound = null
  }

  get hasInitialValue () {
    return this.initialValue
  }
}
