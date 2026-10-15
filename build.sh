#!/bin/bash
# usage: ./build.sh "password"
# Edit source/index.html, then run this to write the password protected index.html that GitHub Pages serves.
set -e
cd "$(dirname "$0")"
PW="$1"
[ -n "$PW" ] || { echo "Give a password: ./build.sh \"my password\""; exit 1; }
rm -rf .enc && mkdir .enc
npx --yes staticrypt@3 source/index.html -p "$PW" --short --remember 14 -d .enc \
  --template-title "ST Performance Programme Builder" \
  --template-instructions "Enter the access password you were given." \
  --template-button "Open" --template-color-primary "#BD3039" --template-color-secondary "#EDF1F8" >/dev/null
python3 - <<'PY'
import re
src=open('source/index.html').read()
head=src.split('<title>')[0]
tags=''.join(re.findall(r'<(?:meta name="(?:apple-mobile-web-app-[a-z-]+|mobile-web-app-capable|application-name|theme-color)"|link rel="(?:manifest|apple-touch-icon|icon)")[^>]*>',head))
tags=re.sub(r'(<meta name="apple-mobile-web-app-title"[^>]*>)',r'\1',tags)
h=open('.enc/index.html').read()
assert '</head>' in h
h=h.replace('</head>',tags+'</head>',1)
open('index.html','w').write(h)
PY
rm -rf .enc
echo "Built index.html (password protected)"
