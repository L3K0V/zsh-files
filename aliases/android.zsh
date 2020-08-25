# Android assets utilities
alias png2webp="find . -name '*.png' | parallel -eta cwebp {} -o {.}.webp"
alias webp2png="find . -name '*.webp' | parallel -eta dwebp {} -o {.}.png"
alias compresspngs="find . -name '*.png' -exec pngquant --ext .png --force 256 {} \;"
alias deletepngs="find . -type f -iname \*.png -delete"
alias deletewebps="find . -type f -iname \*.webp -delete"

alias gradleclean="rm -rf $HOME/.gradle/caches/"