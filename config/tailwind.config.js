module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Raleway', 'sans-serif'],
      },
      colors: {
        periwinkle: {
          DEFAULT: '#685FD6', // Primary active/hover accent
          dark: '#4C4682',    // Logo & header text
          light: '#F0F2FC',   // Hover background & email badge
        },
        surface: {
          bg: '#FAFBFD',      // Main body background
          text: '#2D2B4A',    // Base body text
          border: '#EAEFFC',  // Divider line & container border
          subtle: '#E0E3F6',  // Badge border
        },
        nav: {
          text: '#7973A8',    // Default nav link text
          muted: '#8C87B3',   // Subtle nav label & logout button
        }
      }
    },
  },
  plugins: [],
}