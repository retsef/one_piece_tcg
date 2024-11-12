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
      fontFamily: {
        'roboto': ['Roboto', 'sans-serif']
      },
      colors: {
        white: '#F5F3F3',
        primary: {
          50: '#f6eae9',
          100: '#eed5d3',
          200: '#ddaca7',
          300: '#cc837c',
          400: '#bb5a50',
          500: '#aa3125',
          600: '#992c21',
          700: '#88271d',
          800: '#762219',
          900: '#661d16'
        },
        red: {
          50: '#FFEBEE',
          100: '#FFCDD2',
          200: '#EF9A9A',
          300: '#E57373',
          400: '#EF5350',
          500: '#B92E25',
          600: '#A61B1B',
          700: '#911111',
          800: '#7D0808',
          900: '#690000',
        }
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
    require("tailwindcss-animate"),

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
