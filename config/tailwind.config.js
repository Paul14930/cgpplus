const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*',
    './node_modules/flowbite/**/*.js',
  ],
  theme: {
    extend: {
      colors: {
        primary: {
          50: '#eff6ff',   // Bleu très clair
          100: '#dbeafe',  // Bleu clair
          200: '#bfdbfe',  // Bleu moyen clair
          300: '#93c5fd',  // Bleu moyen
          400: '#60a5fa',  // Bleu vif
          500: '#3b82f6',  // Bleu primaire
          600: '#2563eb',  // Bleu foncé
          700: '#1d4ed8',  // Bleu très foncé
          800: '#1e40af',
          900: '#1e3a8a',
        },
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
    require('flowbite/plugin'),
  ]
}
