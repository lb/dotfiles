bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

alias ll="ls -FGlAhp"
alias psx="ps aux | less"
alias ..='cd ../'
alias ....='cd ../../'
alias pubip="curl ip.appspot.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

ii() {
  echo -e "\nYou are logged on ${RED}$HOST"
  echo -e "\nAdditionnal information:$NC " ; uname -a
  echo -e "\n${RED}Users logged on:$NC " ; w -h
  echo -e "\n${RED}Current date :$NC " ; date
  echo -e "\n${RED}Machine stats :$NC " ; uptime
  echo -e "\n${RED}Current network location :$NC " ; scselect
  echo -e "\n${RED}Public facing IP Address :$NC " ; pubip
  echo
}

google() {
  $BROWSER "http://www.google.com/search?q=$@";
}

isitup() {
  lynx -dump -display_charset UTF-8 http://isitup.org/$@
}

alias gmail="$BROWSER https://www.gmail.com"

alias flush="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

alias desktophide="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias desktopshow="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

alias httpup="python -m SimpleHTTPServer"
alias connections="lsof -P -i -n | cut -f 1 -d \" \"| sort | uniq -c | sort -n"

alias du="du -kh"
alias df="df -kTh"

function extract()      
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1     ;;
      *.tar.gz)    tar xvzf $1     ;;
      *.bz2)       bunzip2 $1      ;;
      *.rar)       unrar x $1      ;;
      *.gz)        gunzip $1       ;;
      *.tar)       tar xvf $1      ;;
      *.tbz2)      tar xvjf $1     ;;
      *.tgz)       tar xvzf $1     ;;
      *.zip)       unzip $1        ;;
      *.Z)         uncompress $1   ;;
      *.7z)        7z x $1         ;;
      *)           echo "'$1' cannot be extracted via >extract<" ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

function mkd() {
  mkdir -p "$@" && cd "$@"
}

function dataurl() {
  local mimeType=$(file -b --mime-type "$1")
  if [[ $mimeType == text/* ]]; then
    mimeType="${mimeType};charset=utf-8"
  fi
  echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

findPid () { lsof -t -c "$@" ; }

alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

alias ttop="top -R -F -s 10 -o rsize"

function dataurl() {
  local mimeType=$(file -b --mime-type "$1")
  if [[ $mimeType == text/* ]]; then
    mimeType="${mimeType};charset=utf-8"
  fi
  echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
