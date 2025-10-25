/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: 'class',
  content: ['./src/**/*.{astro,md,mdx,ts,tsx,jsx,html}'],
  theme: {
    container: { center: true, padding: '1.5rem' },
    extend: {
      colors: {
        brand: '#38bdf8',
        brand2: '#a78bfa',
      },
      borderRadius: { xl2: '1rem' },
    },
  },
  plugins: [require('@tailwindcss/typography')],
};
