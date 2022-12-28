module.exports = {
  purge: [
    './app/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/javascript/**/*.vue',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    screens: {
      xs: { min: '350px' },
      sm: { min: '640px' },
      md: { min: '768px' },
      lg: { min: '1024px' },
      xl: { min: '1200px' },
      xxl: { min: '1440px' },
    },
    container: {
      center: true,
    },
    extend: {
      minWidth: {
        568: '568px',
        1024: '1024px',
        1200: '1200px',
        1366: '1366px',
        1440: '1440px',
      },
      maxWidth: {
        568: '568px',
        1024: '1024px',
        1200: '1200px',
        1366: '1366px',
        1440: '1440px',
      },
      colors: {
        fb: '#4267B2',
        orange: '#E88481',
      },
      spacing: {
        500: '500px',
        600: '600px',
        700: '700px',
      },
    },
  },
  variants: {
    extend: {
      backgroundColor: ['odd', 'even'],
    },
  },
  plugins: [
    require('tailwindcss/plugin'),
    require('@tailwindcss/aspect-ratio'),
    require('tw-elements/dist/plugin'),
  ],
};
