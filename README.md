# ST Performance Program Builder

Single file strength and conditioning program builder, skinned to ST
Performance Global. Everything a player builds stays in their own
browser on their own device.

## Deploy

Push every file in this folder to the repository root, then turn on
GitHub Pages for the main branch. The app is `index.html`, so it serves
from the root URL with no further configuration.

Paths are relative, so the same folder works from a project page, a user
page or a local copy opened straight from disk.

## Contents

| File | Purpose |
|---|---|
| `index.html` | The whole application. Logos are embedded, so nothing else is required for it to run |
| `site.webmanifest` | Add to Home Screen behaviour, naming and theming |
| `ST-app-icon-1024.png` | Home screen icon master |
| `ST-app-icon-512.png` | Android and PWA install |
| `ST-app-icon-192.png` | Android home screen |
| `ST-app-icon-180.png` | iOS home screen |
| `ST-favicon-64.png` `ST-favicon-32.png` | Browser tab |
| `favicon.ico` | Desktop browser fallback |

## Brand

Colour follows the ST Performance token system. The screen is a dark
surface, so it takes the `.on-dark` roles: navy deep ground with Gold
Highlight accents. Printed output lands on paper, so the accent drops to
Bronze Gold `#A8791A`. Full gold disappears on white.

Logos are the mountain mark, gold on the dark interface and navy on
every printed page.

## Add to Home Screen

On iPhone open the site in Safari, press Share, then Add to Home
Screen. On Android use the browser menu, then Add to Home screen. The
app then launches without browser chrome and its saved program is far
less likely to be cleared.

## Saved programs

Programs live in browser storage on the device. That storage can be
cleared by the browser after long periods of inactivity, so the Save
button is the real backup. It writes a small file that the Load button
restores exactly.
