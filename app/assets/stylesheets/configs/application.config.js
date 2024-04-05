const plugin = require('tailwindcss/plugin')

/** @type {import('tailwindcss').Config} */
export default {
  content: [
    './app/views/**/*.html.erb',
    './app/views/**/*.html+phone.erb',
    './app/views/**/*.html+electron.erb',
    './app/views/**/*.turbo_stream.erb',
    './app/helpers/**/*.rb',
    './app/components/**/*.{rb,html.erb}',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './config/locales/**/*.yml'
  ],
  theme: {
    extend: {
      colors: {
        'primary-50': '#f6eae9',
        'primary-100': '#eed5d3',
        'primary-200': '#ddaca7',
        'primary-300': '#cc837c',
        'primary-400': '#bb5a50',
        'primary-500': '#aa3125',
        'primary-600': '#992c21',
        'primary-700': '#88271d',
        'primary-800': '#762219',
        'primary-900': '#661d16'
      },
      maxWidth: {
        '1/2': '50%',
        '1/4': '25%',
        '1/3': '33.333333%'
      },
      transitionTimingFunction: {
        'in-expo': 'cubic-bezier(0.95, 0.05, 0.795, 0.035)',
        'out-expo': 'cubic-bezier(0.19, 1, 0.22, 1)',
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),

    plugin(function ({ addVariant }) {
      addVariant('highlight', ['&.highlight', '.highlight &'])
      addVariant('group-highlight', [':merge(.highlight) &'])

      addVariant('chosen', ['&.chosen', '.chosen &'])
      addVariant('group-chosen', [':merge(.chosen) &'])

      addVariant('checked', ['&.checked', '.checked &'])
      addVariant('group-checked', [':merge(.checked) &'])

      addVariant('disabled', ['&.disabled', '.disabled &'])
      addVariant('group-disabled', [':merge(.disabled) &'])

      addVariant('active', ['&.active', '.active &'])
      addVariant('group-active', [':merge(.active) &'])
    })
  ]
}
