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
    '--text': '#111827',
    '--text-secondary': '#4b5563',
    '--text-tertiary': '#6b7280',
    '--border': '#e5e7eb',
    '--accent': '#228be6',
    '--accent-light': '#74c0fc',
    '--accent-soft': 'rgba(34,139,230,0.08)',
    '--accent-gradient': 'linear-gradient(135deg, #228be6, #7c3aed)',
    '--tag-bg': '#f1f3f5',
    '--tag-text': '#374151',
    '--shadow-sm': '0 1px 2px rgba(0,0,0,0.04)',
    '--shadow-md': '0 4px 12px rgba(0,0,0,0.06)',
    '--radius-sm': '8px',
    '--radius-md': '12px',
    '--radius-lg': '16px',
    '--radius-full': '9999px',
    '--transition': '0.2s ease',
    '--sidebar-width': '320px',
    '--bg-glow-1': 'rgba(34,139,230,0.06)',
    '--bg-glow-2': 'rgba(124,58,237,0.04)',
    // tag palette
    '--tag-blue-bg': 'rgba(34,139,230,0.1)',
    '--tag-blue-text': '#1864ab',
    '--tag-purple-bg': 'rgba(124,58,237,0.1)',
    '--tag-purple-text': '#5f3dc4',
    '--tag-teal-bg': 'rgba(18,184,134,0.1)',
    '--tag-teal-text': '#087f5b',
    '--tag-orange-bg': 'rgba(253,126,20,0.1)',
    '--tag-orange-text': '#d9480f',
    '--tag-pink-bg': 'rgba(230,73,128,0.1)',
    '--tag-pink-text': '#a61e4d',
    // social brand colors
    '--github-color': '#333',
    '--linkedin-color': '#0a66c2',
    '--telegram-color': '#26a5e4',
    '--email-color': '#ea4335',
  }),

  // ── Dark theme tokens ──
  css('[data-theme="dark"]').styles(raw: const {
    '--bg': '#0a0a0a',
    '--surface': '#141414',
    '--surface-hover': '#1e1e1e',
    '--text': '#f4f4f5',
    '--text-secondary': '#d4d4d8',
    '--text-tertiary': '#a1a1aa',
    '--border': '#27272a',
    '--accent': '#60a5fa',
    '--accent-light': '#93c5fd',
    '--accent-soft': 'rgba(96,165,250,0.1)',
    '--accent-gradient': 'linear-gradient(135deg, #60a5fa, #a78bfa)',
    '--tag-bg': '#1e1e1e',
    '--tag-text': '#d4d4d8',
    '--shadow-sm': '0 1px 2px rgba(0,0,0,0.2)',
    '--shadow-md': '0 4px 12px rgba(0,0,0,0.3)',
    '--bg-glow-1': 'rgba(96,165,250,0.06)',
    '--bg-glow-2': 'rgba(167,139,250,0.04)',
    // tag palette (dark)
    '--tag-blue-bg': 'rgba(96,165,250,0.12)',
    '--tag-blue-text': '#93c5fd',
    '--tag-purple-bg': 'rgba(167,139,250,0.12)',
    '--tag-purple-text': '#c4b5fd',
    '--tag-teal-bg': 'rgba(52,211,153,0.12)',
    '--tag-teal-text': '#6ee7b7',
    '--tag-orange-bg': 'rgba(251,146,60,0.12)',
    '--tag-orange-text': '#fdba74',
    '--tag-pink-bg': 'rgba(244,114,182,0.12)',
    '--tag-pink-text': '#f9a8d4',
    // social brand colors (dark)
    '--github-color': '#e4e4e7',
    '--linkedin-color': '#60a5fa',
    '--telegram-color': '#60a5fa',
    '--email-color': '#f87171',
  }),

  // ── Body ──
  css('html, body').styles(raw: const {
    'height': '100%',
  }),
  css('body').styles(raw: const {
    'background': 'var(--bg)',
    'background-image': 'radial-gradient(ellipse at 0% 0%, var(--bg-glow-1) 0%, transparent 50%), radial-gradient(ellipse at 100% 100%, var(--bg-glow-2) 0%, transparent 50%)',
    'background-attachment': 'fixed',
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

  // ═══════════════════════════════════════
  //  PAGE LAYOUT
  // ═══════════════════════════════════════
  css('.main-layout').styles(raw: const {
    'min-height': '100vh',
    'padding': '0',
  }),

  css('.page-layout').styles(raw: const {
    'display': 'flex',
    'flex-direction': 'column',
    'min-height': '100vh',
    'max-width': '1120px',
    'margin': '0 auto',
    'padding': '48px 24px 64px',
    'gap': '0',
  }),

  css('.sidebar').styles(raw: const {
    'flex-shrink': '0',
    'margin-bottom': '32px',
  }),

  css('.content').styles(raw: const {
    'flex': '1',
    'min-width': '0',
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
    'position': 'relative',
  }),

  css('.profile-avatar').styles(raw: const {
    'width': '96px',
    'height': '96px',
    'border-radius': '50%',
    'object-fit': 'cover',
    'margin-bottom': '20px',
    'border': '3px solid var(--accent-light)',
    'transition': 'border-color var(--transition), box-shadow var(--transition)',
    'box-shadow': '0 0 0 4px var(--accent-soft)',
  }),

  css('.profile-name').styles(raw: const {
    'font-size': '1.75rem',
    'font-weight': '700',
    'letter-spacing': '-0.02em',
    'margin-bottom': '4px',
    'background': 'var(--accent-gradient)',
    '-webkit-background-clip': 'text',
    '-webkit-text-fill-color': 'transparent',
    'background-clip': 'text',
  }),

  css('.profile-title').styles(raw: const {
    'font-size': '0.92rem',
    'font-weight': '400',
    'color': 'var(--text-tertiary)',
    'margin-bottom': '4px',
    'font-family': "'JetBrains Mono', 'Fira Code', monospace",
  }),

  css('.profile-location').styles(raw: const {
    'font-size': '0.85rem',
    'color': 'var(--text-tertiary)',
    'margin-bottom': '16px',
  }),
  css('.profile-location i').styles(raw: const {
    'margin-right': '4px',
    'color': 'var(--accent)',
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
    'background': 'var(--accent-soft)',
    'color': 'var(--accent)',
    'border-color': 'var(--accent)',
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
  // Brand-colored hovers for each social
  css('.social-btn--email:hover').styles(raw: const {
    'background': 'var(--email-color)',
    'border-color': 'var(--email-color)',
    'color': '#fff',
    'text-decoration': 'none',
  }),
  css('.social-btn--github:hover').styles(raw: const {
    'background': 'var(--github-color)',
    'border-color': 'var(--github-color)',
    'color': '#fff',
    'text-decoration': 'none',
  }),
  css('.social-btn--linkedin:hover').styles(raw: const {
    'background': 'var(--linkedin-color)',
    'border-color': 'var(--linkedin-color)',
    'color': '#fff',
    'text-decoration': 'none',
  }),
  css('.social-btn--telegram:hover').styles(raw: const {
    'background': 'var(--telegram-color)',
    'border-color': 'var(--telegram-color)',
    'color': '#fff',
    'text-decoration': 'none',
  }),

  // ── Skills section ──
  css('.profile-section').styles(raw: const {
    'margin-bottom': '20px',
  }),
  css('.profile-section-title').styles(raw: const {
    'font-size': '0.82rem',
    'font-weight': '600',
    'text-transform': 'lowercase',
    'letter-spacing': '0.06em',
    'color': 'var(--accent)',
    'margin-bottom': '12px',
    'font-family': "'JetBrains Mono', 'Fira Code', monospace",
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
    'background': 'var(--tag-blue-bg)',
    'color': 'var(--tag-blue-text)',
    'font-size': '0.78rem',
    'font-weight': '500',
    'transition': 'all var(--transition)',
  }),
  // Alternate skill tag colors via nth-child
  css('.skill-tag:nth-child(5n+2)').styles(raw: const {
    'background': 'var(--tag-purple-bg)',
    'color': 'var(--tag-purple-text)',
  }),
  css('.skill-tag:nth-child(5n+3)').styles(raw: const {
    'background': 'var(--tag-teal-bg)',
    'color': 'var(--tag-teal-text)',
  }),
  css('.skill-tag:nth-child(5n+4)').styles(raw: const {
    'background': 'var(--tag-orange-bg)',
    'color': 'var(--tag-orange-text)',
  }),
  css('.skill-tag:nth-child(5n+5)').styles(raw: const {
    'background': 'var(--tag-pink-bg)',
    'color': 'var(--tag-pink-text)',
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
    'color': 'var(--accent)',
  }),

  // ═══════════════════════════════════════
  //  NAVIGATION TABS
  // ═══════════════════════════════════════
  css('.tabs').styles(raw: const {
    'display': 'flex',
    'gap': '24px',
    'margin-bottom': '32px',
    'justify-content': 'center',
  }),
  css('.tab').styles(raw: const {
    'padding': '6px 0',
    'cursor': 'pointer',
    'font-weight': '400',
    'font-size': '0.88rem',
    'color': 'var(--text-tertiary)',
    'transition': 'all var(--transition)',
    'background': 'none',
    'border': 'none',
    'border-bottom': '1.5px solid transparent',
    'font-family': "'JetBrains Mono', 'Fira Code', monospace",
    'text-decoration': 'none',
    'text-align': 'center',
  }),
  css('.tab:hover').styles(raw: const {
    'color': 'var(--text-secondary)',
    'text-decoration': 'none',
  }),
  css('.tab.active').styles(raw: const {
    'color': 'var(--text)',
    'font-weight': '500',
    'border-bottom-color': 'var(--accent)',
  }),

  // ═══════════════════════════════════════
  //  CONTENT CARDS
  // ═══════════════════════════════════════
  css('.card').styles(raw: const {
    'background': 'var(--surface)',
    'border': 'none',
    'border-radius': 'var(--radius-md)',
    'padding': '24px',
    'margin-bottom': '16px',
    'box-shadow': 'var(--shadow-sm)',
    'transition': 'all var(--transition)',
  }),
  css('.card:hover').styles(raw: const {
    'box-shadow': 'var(--shadow-md)',
    'transform': 'translateY(-1px)',
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
    'color': 'var(--accent)',
    'margin': '0',
  }),
  css('.text-title a').styles(raw: const {
    'color': 'var(--accent)',
    'text-decoration': 'none',
    'transition': 'color var(--transition)',
  }),
  css('.text-title a:hover').styles(raw: const {
    'color': 'var(--accent-light)',
    'text-decoration': 'underline',
  }),
  css('.text-subtitle').styles(raw: const {
    'font-size': '0.92rem',
    'font-weight': '600',
    'color': 'var(--text)',
    'margin-bottom': '2px',
  }),
  css('.text-caption').styles(raw: const {
    'font-size': '0.8rem',
    'color': 'var(--accent)',
    'background': 'var(--accent-soft)',
    'padding': '2px 10px',
    'border-radius': 'var(--radius-full)',
    'display': 'inline-block',
    'font-weight': '500',
  }),
  css('.text-body').styles(raw: const {
    'font-size': '0.92rem',
    'line-height': '1.8',
    'color': 'var(--text)',
    'margin': '14px 0 0',
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
    'background': 'var(--tag-blue-bg)',
    'color': 'var(--tag-blue-text)',
    'font-size': '0.72rem',
    'font-weight': '500',
    'letter-spacing': '0.01em',
    'transition': 'all var(--transition)',
    'font-family': "'JetBrains Mono', 'Fira Code', monospace",
  }),
  css('.tag:nth-child(5n+2)').styles(raw: const {
    'background': 'var(--tag-purple-bg)',
    'color': 'var(--tag-purple-text)',
  }),
  css('.tag:nth-child(5n+3)').styles(raw: const {
    'background': 'var(--tag-teal-bg)',
    'color': 'var(--tag-teal-text)',
  }),
  css('.tag:nth-child(5n+4)').styles(raw: const {
    'background': 'var(--tag-orange-bg)',
    'color': 'var(--tag-orange-text)',
  }),
  css('.tag:nth-child(5n+5)').styles(raw: const {
    'background': 'var(--tag-pink-bg)',
    'color': 'var(--tag-pink-text)',
  }),
  css('.tag:hover').styles(raw: const {
    'opacity': '0.8',
  }),

  // ── Section empty state ──
  css('.section-empty').styles(raw: const {
    'text-align': 'center',
    'padding': '48px 24px',
    'color': 'var(--text-tertiary)',
    'font-size': '0.9rem',
  }),

  // ═══════════════════════════════════════
  //  GEEKY ELEMENTS
  // ═══════════════════════════════════════

  // Monospace utility
  css('.mono').styles(raw: const {
    'font-family': "'JetBrains Mono', 'Fira Code', 'SF Mono', 'Cascadia Code', monospace",
  }),

  // Accent text utility
  css('.accent').styles(raw: const {
    'color': 'var(--accent)',
  }),
  css('.muted').styles(raw: const {
    'color': 'var(--text-tertiary)',
  }),

  // Blinking cursor
  css('.cursor').styles(raw: const {
    'color': 'var(--accent)',
    'font-weight': '300',
    'animation': 'blink 1s step-end infinite',
  }),
  css.keyframes('blink', const {
    '0%, 100%': Styles(raw: {'opacity': '1'}),
    '50%': Styles(raw: {'opacity': '0'}),
  }),

  // Footer
  css('.site-footer').styles(raw: const {
    'margin-top': '48px',
    'padding-top': '24px',
    'border-top': '1px solid var(--border)',
    'text-align': 'center',
  }),
  css('.footer-text').styles(raw: const {
    'font-size': '0.78rem',
    'color': 'var(--text-tertiary)',
    'font-family': "'JetBrains Mono', 'Fira Code', monospace",
    'letter-spacing': '0.02em',
  }),

  // ═══════════════════════════════════════
  //  RESPONSIVE — Wide (desktop): horizontal layout
  // ═══════════════════════════════════════
  css.media(const MediaQuery.screen(minWidth: Unit.pixels(900)), [
    css('.page-layout').styles(raw: const {
      'flex-direction': 'row',
      'gap': '48px',
      'align-items': 'flex-start',
      'padding': '48px 40px 64px',
    }),
    css('.sidebar').styles(raw: const {
      'position': 'sticky',
      'top': '48px',
      'width': 'var(--sidebar-width)',
      'margin-bottom': '0',
    }),
    css('.profile-header').styles(raw: const {
      'text-align': 'center',
    }),
    css('.profile-bio').styles(raw: const {
      'max-width': 'none',
    }),
    css('.tabs').styles(raw: const {
      'justify-content': 'flex-start',
    }),
  ]),

  // ═══════════════════════════════════════
  //  RESPONSIVE — Tablet
  // ═══════════════════════════════════════
  css.media(const MediaQuery.screen(maxWidth: Unit.pixels(899)), [
    css('.page-layout').styles(raw: const {
      'max-width': '720px',
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
    css('.page-layout').styles(raw: const {
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
