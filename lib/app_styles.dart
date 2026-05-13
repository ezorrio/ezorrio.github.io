import 'package:jaspr/dom.dart';

@css
final List<StyleRule> appStyles = [
  // ── Reset & base ──
  css('*, *::before, *::after').styles(raw: const {
    'box-sizing': 'border-box',
    'margin': '0',
    'padding': '0',
  }),

  // ── Light theme tokens ──
  css(':root').styles(raw: const {
    '--bg': '#f8f9fa',
    '--surface': '#ffffff',
    '--surface-hover': '#f1f3f5',
    '--text': '#1a1a2e',
    '--text-secondary': '#6c757d',
    '--text-tertiary': '#adb5bd',
    '--border': '#e9ecef',
    '--accent': '#228be6',
    '--accent-soft': 'rgba(34,139,230,0.08)',
    '--tag-bg': '#f1f3f5',
    '--tag-text': '#495057',
    '--shadow-sm': '0 1px 2px rgba(0,0,0,0.04)',
    '--shadow-md': '0 4px 12px rgba(0,0,0,0.06)',
    '--radius-sm': '8px',
    '--radius-md': '12px',
    '--radius-lg': '16px',
    '--radius-full': '9999px',
    '--transition': '0.2s ease',
  }),

  // ── Dark theme tokens ──
  css('[data-theme="dark"]').styles(raw: const {
    '--bg': '#0a0a0a',
    '--surface': '#141414',
    '--surface-hover': '#1e1e1e',
    '--text': '#e4e4e7',
    '--text-secondary': '#a1a1aa',
    '--text-tertiary': '#71717a',
    '--border': '#27272a',
    '--accent': '#60a5fa',
    '--accent-soft': 'rgba(96,165,250,0.1)',
    '--tag-bg': '#1e1e1e',
    '--tag-text': '#a1a1aa',
    '--shadow-sm': '0 1px 2px rgba(0,0,0,0.2)',
    '--shadow-md': '0 4px 12px rgba(0,0,0,0.3)',
  }),

  // ── Body ──
  css('html, body').styles(raw: const {
    'height': '100%',
  }),
  css('body').styles(raw: const {
    'background': 'var(--bg)',
    'color': 'var(--text)',
    'font-family': "'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif",
    'font-size': '15px',
    'line-height': '1.6',
    '-webkit-font-smoothing': 'antialiased',
    '-moz-osx-font-smoothing': 'grayscale',
    'transition': 'background var(--transition), color var(--transition)',
  }),

  // ── Links ──
  css('a').styles(raw: const {
    'color': 'var(--accent)',
    'text-decoration': 'none',
    'transition': 'color var(--transition)',
  }),
  css('a:hover').styles(raw: const {
    'color': 'var(--text)',
  }),

  // ── Main layout ──
  css('.main-layout').styles(raw: const {
    'max-width': '720px',
    'margin': '0 auto',
    'padding': '48px 24px 64px',
    'min-height': '100vh',
  }),

  // ── Loading ──
  css('.loading').styles(raw: const {
    'display': 'flex',
    'align-items': 'center',
    'justify-content': 'center',
    'min-height': '60vh',
    'color': 'var(--text-tertiary)',
    'font-size': '0.9rem',
    'letter-spacing': '0.02em',
  }),

  // ═══════════════════════════════════════
  //  PROFILE HEADER
  // ═══════════════════════════════════════
  css('.profile-header').styles(raw: const {
    'text-align': 'center',
    'margin-bottom': '40px',
    'position': 'relative',
  }),

  css('.profile-avatar').styles(raw: const {
    'width': '96px',
    'height': '96px',
    'border-radius': '50%',
    'object-fit': 'cover',
    'margin-bottom': '20px',
    'border': '3px solid var(--border)',
    'transition': 'border-color var(--transition)',
  }),

  css('.profile-name').styles(raw: const {
    'font-size': '1.75rem',
    'font-weight': '700',
    'letter-spacing': '-0.02em',
    'margin-bottom': '4px',
    'color': 'var(--text)',
  }),

  css('.profile-title').styles(raw: const {
    'font-size': '1rem',
    'font-weight': '500',
    'color': 'var(--text-secondary)',
    'margin-bottom': '4px',
  }),

  css('.profile-location').styles(raw: const {
    'font-size': '0.85rem',
    'color': 'var(--text-tertiary)',
    'margin-bottom': '16px',
  }),
  css('.profile-location i').styles(raw: const {
    'margin-right': '4px',
  }),

  css('.profile-bio').styles(raw: const {
    'font-size': '0.9rem',
    'line-height': '1.7',
    'color': 'var(--text-secondary)',
    'max-width': '540px',
    'margin': '0 auto 24px',
  }),

  // ── Theme toggle ──
  css('.theme-toggle').styles(raw: const {
    'position': 'absolute',
    'top': '0',
    'right': '0',
    'background': 'var(--surface)',
    'border': '1px solid var(--border)',
    'color': 'var(--text-secondary)',
    'cursor': 'pointer',
    'font-size': '0.9rem',
    'padding': '8px 10px',
    'border-radius': 'var(--radius-sm)',
    'transition': 'all var(--transition)',
    'line-height': '1',
  }),
  css('.theme-toggle:hover').styles(raw: const {
    'background': 'var(--surface-hover)',
    'color': 'var(--text)',
    'border-color': 'var(--text-tertiary)',
  }),

  // ── Social links ──
  css('.social-links').styles(raw: const {
    'display': 'flex',
    'justify-content': 'center',
    'gap': '8px',
    'flex-wrap': 'wrap',
    'margin-bottom': '24px',
  }),
  css('.social-btn').styles(raw: const {
    'display': 'inline-flex',
    'align-items': 'center',
    'justify-content': 'center',
    'width': '40px',
    'height': '40px',
    'border-radius': 'var(--radius-sm)',
    'background': 'var(--surface)',
    'color': 'var(--text-secondary)',
    'border': '1px solid var(--border)',
    'font-size': '1rem',
    'transition': 'all var(--transition)',
    'text-decoration': 'none',
  }),
  css('.social-btn:hover').styles(raw: const {
    'background': 'var(--accent-soft)',
    'border-color': 'var(--accent)',
    'color': 'var(--accent)',
    'text-decoration': 'none',
  }),

  // ── Skills section ──
  css('.profile-section').styles(raw: const {
    'margin-bottom': '20px',
  }),
  css('.profile-section-title').styles(raw: const {
    'font-size': '0.7rem',
    'font-weight': '600',
    'text-transform': 'uppercase',
    'letter-spacing': '0.08em',
    'color': 'var(--text-tertiary)',
    'margin-bottom': '10px',
  }),
  css('.skills-list').styles(raw: const {
    'display': 'flex',
    'flex-wrap': 'wrap',
    'gap': '6px',
    'justify-content': 'center',
  }),
  css('.skill-tag').styles(raw: const {
    'display': 'inline-block',
    'padding': '4px 10px',
    'border-radius': 'var(--radius-full)',
    'background': 'var(--tag-bg)',
    'color': 'var(--tag-text)',
    'font-size': '0.78rem',
    'font-weight': '500',
    'transition': 'all var(--transition)',
  }),

  // ── Languages ──
  css('.languages-list').styles(raw: const {
    'display': 'flex',
    'justify-content': 'center',
    'gap': '16px',
    'flex-wrap': 'wrap',
  }),
  css('.language-item').styles(raw: const {
    'font-size': '0.85rem',
    'color': 'var(--text-secondary)',
  }),
  css('.language-name').styles(raw: const {
    'font-weight': '600',
    'color': 'var(--text)',
  }),
  css('.language-sep').styles(raw: const {
    'margin': '0 4px',
    'color': 'var(--text-tertiary)',
  }),

  // ═══════════════════════════════════════
  //  NAVIGATION TABS
  // ═══════════════════════════════════════
  css('.tabs').styles(raw: const {
    'display': 'flex',
    'gap': '4px',
    'margin-bottom': '32px',
    'border-bottom': '1px solid var(--border)',
    'justify-content': 'center',
  }),
  css('.tab').styles(raw: const {
    'padding': '10px 20px',
    'cursor': 'pointer',
    'font-weight': '500',
    'font-size': '0.9rem',
    'color': 'var(--text-tertiary)',
    'border-bottom': '2px solid transparent',
    'transition': 'all var(--transition)',
    'background': 'none',
    'border-top': 'none',
    'border-left': 'none',
    'border-right': 'none',
    'font-family': 'inherit',
    'text-decoration': 'none',
    'margin-bottom': '-1px',
  }),
  css('.tab:hover').styles(raw: const {
    'color': 'var(--text)',
    'text-decoration': 'none',
  }),
  css('.tab.active').styles(raw: const {
    'color': 'var(--text)',
    'border-bottom-color': 'var(--accent)',
    'font-weight': '600',
  }),

  // ═══════════════════════════════════════
  //  CONTENT CARDS
  // ═══════════════════════════════════════
  css('.card').styles(raw: const {
    'background': 'var(--surface)',
    'border': '1px solid var(--border)',
    'border-radius': 'var(--radius-md)',
    'padding': '24px',
    'margin-bottom': '16px',
    'transition': 'all var(--transition)',
  }),
  css('.card:hover').styles(raw: const {
    'border-color': 'var(--text-tertiary)',
    'box-shadow': 'var(--shadow-md)',
  }),

  // ── Card header row ──
  css('.card-header').styles(raw: const {
    'display': 'flex',
    'justify-content': 'space-between',
    'align-items': 'flex-start',
    'gap': '12px',
    'margin-bottom': '4px',
  }),
  css('.card-meta').styles(raw: const {
    'flex-shrink': '0',
    'text-align': 'right',
  }),

  // ── Typography ──
  css('.text-title').styles(raw: const {
    'font-size': '1.05rem',
    'font-weight': '600',
    'letter-spacing': '-0.01em',
    'color': 'var(--text)',
    'margin': '0',
  }),
  css('.text-title a').styles(raw: const {
    'color': 'var(--text)',
    'text-decoration': 'none',
    'transition': 'color var(--transition)',
  }),
  css('.text-title a:hover').styles(raw: const {
    'color': 'var(--accent)',
  }),
  css('.text-subtitle').styles(raw: const {
    'font-size': '0.9rem',
    'font-weight': '500',
    'color': 'var(--text-secondary)',
    'margin-bottom': '2px',
  }),
  css('.text-caption').styles(raw: const {
    'font-size': '0.8rem',
    'color': 'var(--text-tertiary)',
  }),
  css('.text-body').styles(raw: const {
    'font-size': '0.88rem',
    'line-height': '1.7',
    'color': 'var(--text-secondary)',
    'margin': '12px 0 0',
    'white-space': 'pre-wrap',
  }),

  // ── Tags ──
  css('.tags').styles(raw: const {
    'display': 'flex',
    'flex-wrap': 'wrap',
    'gap': '6px',
    'margin-top': '14px',
  }),
  css('.tag').styles(raw: const {
    'display': 'inline-block',
    'padding': '3px 10px',
    'border-radius': 'var(--radius-full)',
    'background': 'var(--tag-bg)',
    'color': 'var(--tag-text)',
    'font-size': '0.75rem',
    'font-weight': '500',
    'letter-spacing': '0.01em',
  }),

  // ── Section empty state ──
  css('.section-empty').styles(raw: const {
    'text-align': 'center',
    'padding': '48px 24px',
    'color': 'var(--text-tertiary)',
    'font-size': '0.9rem',
  }),

  // ═══════════════════════════════════════
  //  RESPONSIVE — Tablet
  // ═══════════════════════════════════════
  css.media(const MediaQuery.screen(maxWidth: Unit.pixels(768)), [
    css('.main-layout').styles(raw: const {
      'padding': '32px 20px 48px',
    }),
    css('.profile-name').styles(raw: const {
      'font-size': '1.5rem',
    }),
    css('.profile-bio').styles(raw: const {
      'font-size': '0.88rem',
    }),
  ]),

  // ═══════════════════════════════════════
  //  RESPONSIVE — Mobile
  // ═══════════════════════════════════════
  css.media(const MediaQuery.screen(maxWidth: Unit.pixels(480)), [
    css('.main-layout').styles(raw: const {
      'padding': '20px 16px 40px',
    }),
    css('.profile-avatar').styles(raw: const {
      'width': '72px',
      'height': '72px',
    }),
    css('.profile-name').styles(raw: const {
      'font-size': '1.35rem',
    }),
    css('.profile-title').styles(raw: const {
      'font-size': '0.9rem',
    }),
    css('.tabs').styles(raw: const {
      'gap': '0',
    }),
    css('.tab').styles(raw: const {
      'padding': '10px 14px',
      'font-size': '0.85rem',
    }),
    css('.card').styles(raw: const {
      'padding': '18px',
      'border-radius': 'var(--radius-sm)',
    }),
    css('.card-header').styles(raw: const {
      'flex-direction': 'column',
      'gap': '4px',
    }),
    css('.card-meta').styles(raw: const {
      'text-align': 'left',
    }),
    css('.social-btn').styles(raw: const {
      'width': '36px',
      'height': '36px',
      'font-size': '0.9rem',
    }),
  ]),
];
