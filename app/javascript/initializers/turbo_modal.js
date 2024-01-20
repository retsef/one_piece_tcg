function isJson (item) {
  item = typeof item !== 'string'
    ? JSON.stringify(item)
    : item

  try {
    item = JSON.parse(item)
  } catch (e) { return false }

  return typeof item === 'object' && item !== null
}

const newConfirmMethod = async (titleOrParams, _formElement) => {
  const modalId = 'modal-confirm-' + Math.random().toString(36).substring(7)
  const params = isJson(titleOrParams) ? JSON.parse(titleOrParams) : { title: titleOrParams }

  // window.Modal_template
  const modalTemplate = document.getElementById('modal-confirm-template').innerHTML
    .replace(/MODAL_ID/g, modalId)
    .replace(/MODAL_TITLE/g, params.title || 'Are you sure?')
    .replace(/MODAL_BODY/g, params.body || 'This operation cannot be reverted')
    .replace(/MODAL_COLOR/g, params.color || 'red')
    .replace(/MODAL_COMMIT/g, params.commit || 'Commit')
    .replace(/MODAL_CANCEL/g, params.cancel || 'Cancel')

  document.body.insertAdjacentHTML('beforeend', modalTemplate)

  const confirmModal = document.getElementById(modalId)

  const showEvent = new CustomEvent('modal:show', { bubbles: true, cancelable: true })
  confirmModal.dispatchEvent(showEvent)

  return new Promise((resolve, _reject) => {
    const confirmButton = confirmModal.querySelector("[data-behavior='commit']")
    const cancelButton = confirmModal.querySelector("[data-behavior='cancel']")

    confirmButton.addEventListener('click', () => { resolve(true) })
    cancelButton.addEventListener('click', () => { resolve(false) })
  })
}

// Turbo > 7.1.0
window.Turbo.setConfirmMethod(newConfirmMethod)
