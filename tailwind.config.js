module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/javascript/**/*.{js,jsx}',
    './app/helpers/**/*.rb'
  ],
  theme: {
    extend: {}
  },
  plugins: [require('daisyui')],
  daisyui: {
    themes: ['light', 'dark', 'corporate'],
    defaultTheme: 'corporate'
  }
}
