function hideElement (targetElement) {
  if (targetElement == null) return
  targetElement.style.setProperty('display', 'none')
}

function showElement (targetElement) {
  if (targetElement == null) return
  targetElement.style.removeProperty('display')
}

function isVisible (targetElement) {
  return !!(targetElement.offsetWidth || targetElement.offsetHeight || targetElement.getClientRects().length);
}

export { hideElement, showElement, isVisible }
