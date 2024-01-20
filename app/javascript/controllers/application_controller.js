import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  debounce (func, timeout = 300) {
    let timer = null
    return (...args) => {
      clearTimeout(timer)
      timer = setTimeout(() => {
        func.apply(this, args)
      }, timeout)
    }
  }

  throttle (func, threshhold = 250) {
    let last, deferTimer

    return (...args) => {
      const now = new Date()

      if (last && now < last + threshhold) {
        // hold on to it
        clearTimeout(deferTimer)
        deferTimer = setTimeout(() => {
          last = now
          func.apply(this, args)
        }, threshhold)
      } else {
        last = now
        func.apply(this, args)
      }
    }
  }
}
