# cd helpers
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ls='ls -G'
alias less='less -R'
alias tree='tree -C'
alias myp='ifconfig | grep inet | awk "{print $2}" | sed -e "s/\/.*$//" | head -n 1'
alias wav-dl='yt-dlp -x --audio-format wav'
alias shortid='uuidgen | cut -c -8'
alias clear-cb='echo "cleared" | pbcopy'

alias dc='docker compose'
alias d-kill='docker ps | tail +2 | awk "{ print $1 }" | xargs docker kill'
alias d-rm-orphans='docker images | rg none | awk "{ print $2 }" | xargs docker rmi'
