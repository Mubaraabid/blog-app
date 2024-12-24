const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    screens: {
      sm: '480px',
      md: '768px',
      lg: '976px',
      xl: '1440px',
    },
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        serif: ['Merriweather', 'serif'],
      },
    },
    colors:{
    'blue': '#1fb6ff',
      'purple': '#7e5bef',
      'pink': '#ff49db',
      'orange': '#ff7849',
      'green': {
        100: '#15803d',
        200: '#14532d',
      },

      'yellow': '#ffc82c',
      'gray-dark': '#273444',
      'white': '#ffffff',
      'gray': {
        100: '#8492a6',
        200: '#6b7280',
        300: '#1f2937',
        400: '#4b5563',
        500: '#9ca3af'
      },

      'gray-light': '#d3dce6',
    }
  },
  
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
