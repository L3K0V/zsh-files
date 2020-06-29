alias dots='cd ~/Workspace/dotfiles'
alias work='cd ~/Workspace'
alias elsys='cd ~/Workspace/elsys'
alias tues='cd ~/Workspace/elsys'

alias dodi='cd ~/Workspace/dodi'

alias sslme='sudo certbot -d lekov.me --manual --preferred-challenges dns certonly'

# Python
alias py='python'
alias pyserver='py -m http.server'
alias pyclean='find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf'

# Update all outdated packages
alias pipup="pip freeze --local | cut -d = -f 1  | xargs pip install -U"

alias grep='grep --color'

alias dockerclean="docker images |grep -v REPOSITORY|awk '{print $1}'|xargs -L1 docker pull; docker rmi $(docker images -f 'dangling=true' -q) --force"

alias less='less -R'

# Administer like a sir
alias please='sudo'

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew upgrade; brew cask upgrade; brew cleanup; npm i -g npm; npm update -g; sudo gem update --system; sudo gem update'

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Android assets utilities
alias png2webp="find . -name '*.png' | parallel -eta cwebp {} -o {.}.webp"
alias webp2png="find . -name '*.webp' | parallel -eta dwebp {} -o {.}.png"
alias compresspngs="find . -name '*.png' -exec pngquant --ext .png --force 256 {} \;"
alias deletepngs="find . -type f -iname \*.png -delete"
alias deletewebps="find . -type f -iname \*.webp -delete"
alias gradleclean="rm -rf $HOME/.gradle/caches/"

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
