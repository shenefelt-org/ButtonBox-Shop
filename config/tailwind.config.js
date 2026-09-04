module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/views/**/*.erb',
    './app/components/**/*.erb',
  ],
  safelist: [
    // Periwinkle colors
    'text-periwinkle',
    'text-periwinkle-dark',
    'text-periwinkle-light',
    'bg-periwinkle',
    'bg-periwinkle-dark',
    'bg-periwinkle-light',
    'border-periwinkle',
    'border-periwinkle-dark',
    'border-periwinkle-light',
    'hover:text-periwinkle',
    'hover:text-periwinkle-dark',
    'hover:bg-periwinkle',
    'hover:bg-periwinkle-dark',
    // Surface colors
    'bg-surface-bg',
    'text-surface-text',
    'border-surface-border',
    'bg-surface-subtle',
    'border-surface-subtle',
    'text-nav-text',
    'text-nav-muted',
    'hover:text-nav-muted',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Raleway', 'sans-serif'],
      },
      colors: {
        periwinkle: {
          DEFAULT: '#685FD6',
          dark: '#4C4682',
          light: '#F0F2FC',
        },
        surface: {
          bg: '#FAFBFD',
          text: '#2D2B4A',
          border: '#EAEFFC',
          subtle: '#E0E3F6',
        },
        nav: {
          text: '#7973A8',
          muted: '#8C87B3',
        }
      }
    },
  },
  plugins: [],
}