return unless defined? Premailer

attributes = {
  'h1': {'text-align': 'align'},
  'h2': {'text-align': 'align'},
  'h3': {'text-align': 'align'},
  'h4': {'text-align': 'align'},
  'h5': {'text-align': 'align'},
  'h6': {'text-align': 'align'},
  'p': {'text-align': 'align'},
  'div': {'text-align': 'align'},
  'blockquote': {'text-align': 'align'},
  'body': {'background-color': 'bgcolor'},
  'table': {
    '-premailer-align': 'align',
    'background-color': 'bgcolor',
    'background-image': 'background',
    '-premailer-width': 'width',
    '-premailer-height': 'height',
    '-premailer-cellpadding': 'cellpadding',
    '-premailer-cellspacing': 'cellspacing',
    '-premailer-border': 'border',
  },
  'tr': {
    'text-align': 'align',
    'background-color': 'bgcolor',
    '-premailer-height': 'height',
    '-premailer-border': 'border',
  },
  'th': {
    'text-align': 'align',
    'background-color': 'bgcolor',
    'vertical-align': 'valign',
    '-premailer-width': 'width',
    '-premailer-height': 'height',
    '-premailer-border': 'border',
  },
  'td': {
    'text-align': 'align',
    'background-color': 'bgcolor',
    'vertical-align': 'valign',
    '-premailer-width': 'width',
    '-premailer-height': 'height',
  },
  'img': {
    'float': 'align',
    '-premailer-width': 'width',
    '-premailer-height': 'height',
    '-premailer-border': 'border'
  }
}

Premailer::RELATED_ATTRIBUTES.merge!(attributes)
