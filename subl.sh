#install sublime->subl link to open sublime from terminal
SUBLIME="/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"
SUBLIME_BIN="/usr/local/bin/sublime"
if [ -e "${SUBLIME}" ] && [ -x "${SUBLIME}" ] && [ ! -e "${SUBLIME_BIN}" ]; then
    ln -s "${SUBLIME}" "${SUBLIME_BIN}"
fi
