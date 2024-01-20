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
      width: {
        a4: '210mm',
        zebra: '50.8mm'
      },
      height: {
        a4: '297mm',
        zebra: '25.4mm'
      },
      screens: {
        print: { raw: 'print' }
      }
    },
  },
  safelist: [
    'col-auto', 'col-span-1', 'col-span-2', 'col-span-3', 'col-span-4',
    'col-span-5', 'col-span-6', 'col-span-7', 'col-span-8', 'col-span-9',
    'col-span-10', 'col-span-11', 'col-span-12', 'col-span-full',
    'sm:col-auto', 'sm:col-span-1', 'sm:col-span-2', 'sm:col-span-3', 'sm:col-span-4',
    'sm:col-span-5', 'sm:col-span-6', 'sm:col-span-7','sm:col-span-8', 'sm:col-span-9',
    'sm:col-span-10', 'sm:col-span-11', 'sm:col-span-12', 'sm:col-span-full',
    'md:col-auto', 'md:col-span-1', 'md:col-span-2', 'md:col-span-3', 'md:col-span-4',
    'md:col-span-5', 'md:col-span-6', 'md:col-span-7', 'md:col-span-8', 'md:col-span-9',
    'md:col-span-10', 'md:col-span-11', 'md:col-span-12', 'md:col-span-full'
  ],
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),

    plugin(function ({ addVariant }) {
      addVariant('highlight', ['&.highlight', '.highlight &'])
      addVariant('chosen', ['&.chosen', '.chosen &'])
      addVariant('disabled', ['&.disabled', '.disabled &'])
      addVariant('active', ['&.active', '.active &'])

      addVariant('electron', ['&.electron', '.electron &'])
    })
  ]
}
