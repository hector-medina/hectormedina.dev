import { defineCollection, z } from 'astro:content';
import readingTime from "reading-time";

const blog = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    description: z.string().optional(),
    pubDate: z.coerce.date(),
    heroImage: z.string().optional(),
    category: z.string().optional(),
    tags: z.array(z.string()).optional(),
  }),
  transform: (data, { rawContent }) => {
    const stats = readingTime(rawContent);
    return {
      ...data,
      readingTime: Math.ceil(stats.minutes),
    };
  },
});

export const collections = { blog };
