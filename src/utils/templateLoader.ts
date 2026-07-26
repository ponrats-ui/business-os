declare const require: (path: string) => unknown;

import { StoreTemplate } from '../types';

type TemplatePayload = {
  templates: StoreTemplate[];
};

let cachedTemplates: StoreTemplate[] | null = null;

function loadTemplatePayload(): TemplatePayload {
  try {
    const rawPayload = require('../data/templates.json') as TemplatePayload | unknown;

    if (rawPayload && typeof rawPayload === 'object' && 'templates' in rawPayload) {
      return rawPayload as TemplatePayload;
    }
  } catch (error) {
    console.warn('Unable to load template payload from JSON:', error);
  }

  return { templates: [] };
}

export function loadTemplates(): StoreTemplate[] {
  if (!cachedTemplates) {
    cachedTemplates = loadTemplatePayload().templates ?? [];
  }

  return cachedTemplates;
}

export function getTemplateById(id: string): StoreTemplate | undefined {
  return loadTemplates().find((template) => template.id === id);
}

export function getTemplatesByCategory(category: string): StoreTemplate[] {
  return loadTemplates().filter((template) => template.category === category);
}

export const templates = loadTemplates();
