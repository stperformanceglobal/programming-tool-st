#!/bin/bash
# usage: ./build.sh "password"
# Edit source/index.html, then run this to write the password protected index.html that GitHub Pages serves.
set -e
cd "$(dirname "$0")"
PW="$1"
[ -n "$PW" ] || { echo "Give a password: ./build.sh \"my password\""; exit 1; }
SKEL="${SKELETON_KEY:-$(cat /home/claude/gate/skeleton.txt)}"
python3 - "$PW" "$SKEL" <<'PY2'
import re,sys,subprocess
src=open('source/index.html').read()
head=src.split('<title>')[0]
tags=''.join(re.findall(r'<(?:meta name="(?:apple-mobile-web-app-[a-z-]+|mobile-web-app-capable|application-name|theme-color)"|link rel="(?:manifest|apple-touch-icon|icon)")[^>]*>',head))
subprocess.check_call(['python3','/home/claude/gate/gate.py','source/index.html','index.html','--title','ST Performance Programme Builder','--instr','Enter the access password you were given.','--color','#BD3039','--bg','#EDF1F8','--head',tags,'--pw',sys.argv[1],'--pw',sys.argv[2]])
PY2
echo "Built index.html (password protected)"
