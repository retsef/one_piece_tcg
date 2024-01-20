function removeClassIfExist (targetElement, className) {
  if (targetElement == null) return
  if (className == null) return

  if (className.includes(' ')) {
    className.split(' ').forEach((className) => {
      removeClassIfExist(targetElement, className)
    })
    return
  }

  if (typeof className === 'object') {
    className.forEach((className) => {
      removeClassIfExist(targetElement, className)
    })
    return
  }

  if (targetElement.classList.contains(className)) { targetElement.classList.remove(className) }
}

function addClassUnlessExist (targetElement, className) {
  if (targetElement == null) return
  if (className == null) return

  if (className.includes(' ')) {
    className.split(' ').forEach((className) => {
      addClassUnlessExist(targetElement, className)
    })
    return
  }

  if (typeof className === 'object') {
    className.forEach((className) => {
      addClassUnlessExist(targetElement, className)
    })
    return
  }

  if (!targetElement.classList.contains(className)) { targetElement.classList.add(className) }
}

export { removeClassIfExist, addClassUnlessExist }
