alias dots='cd ~/Workspace/dotfiles'
alias work='cd ~/Workspace'
alias elsys='cd ~/Workspace/elsys'
alias tues='cd ~/Workspace/elsys'

alias kolibri='cd ~/Workspace/Kolibri'
alias cockpit='kolibri; cd kolibri-cockpit'

# Homebrew
alias brews='brew list -1'

# Python
alias pyserver='python3 -m http.server'
alias py='python'
alias py3='python3'
alias pyclean='find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf'

# Update all outdated packages
alias pipup="pip freeze --local | cut -d = -f 1  | xargs pip install -U"
alias pipu="pip install -U"

alias grep='grep --color'

alias less='less -R'

# Administer like a sir
alias please='sudo'

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm i -g npm; npm update -g; sudo gem update --system; sudo gem update; apm upgrade --confirm false'

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Android assets utilities
alias png2webp="find . -name '*.png' | parallel -eta cwebp {} -o {.}.webp"
alias webp2png="find . -name '*.webp' | parallel -eta dwebp {} -o {.}.png"
alias compresspngs="find . -name '*.png' -exec pngquant --ext .png --force 256 {} \;"
alias deletepngs="find . -type f -iname \*.png -delete"
alias deletewebps="find . -type f -iname \*.webp -delete"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume output volume 75'"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
