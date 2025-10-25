// @ts-check
import { defineConfig } from 'astro/config';
import tailwind from '@astrojs/tailwind';
import mdx from '@astrojs/mdx';
import astroIcon from 'astro-icon';

// https://astro.build/config
export default defineConfig({
    site: 'https://hectormedina.dev',
    integrations: [
        tailwind({
            applyBaseStyles: true 
        }),
        mdx(),
        astroIcon(),
    ],

    build: {
        format: 'directory'
    },
    vite: {
        build: { target: 'es2020' }
    }
}); 
