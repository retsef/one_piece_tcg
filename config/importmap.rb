# Pin npm packages by running ./bin/importmap

pin '@hotwired/stimulus', to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin '@hotwired/turbo', to: 'turbo.min.js'
pin '@hotwired/strada', to: '@hotwired/strada/dist/strada.js'
# pin "@hotwired/strada", to: "https://ga.jspm.io/npm:@hotwired/strada@1.0.0-beta1/dist/strada.js"

pin '@rails/actiontext', to: 'actiontext.js'
pin '@rails/activestorage', to: 'activestorage.esm.js'
pin '@rails/request.js', to: '@rails/request.js/dist/requestjs.js'
# pin '@rails/request.js', to: "https://ga.jspm.io/npm:@rails/request.js@0.0.9/src/index.js"

pin 'trix', to: 'trix/dist/trix.esm.js'

pin "local-time", to: 'local-time/app/assets/javascripts/local-time.es2017-esm.js'

pin 'howler', to: 'howler/dist/howler.js'

# Sentry
# pin '@sentry/browser', to: 'sentry.bundle.tracing.min.js'

# pin_all_from 'vendor/javascript', under: 'vendors'

pin_all_from 'app/javascript/initializers', under: 'initializers'
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin_all_from 'app/javascript/helpers', under: 'helpers'

pin 'application' # , preload: true
