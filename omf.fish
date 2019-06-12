# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
  
  
# Utils
function take 
  mkdir -p $argv; cd $argv
end

# List
alias l="ls -a"

# Clear screan
alias c="clear"

# Folders
alias p="cd ~/Projects"
alias d="cd ~/Downloads"

# Git
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gcmsg='git commit -m'
alias gpom="git push origin master"

# IP
alias ip="ifconfig |grep inet"

# Prisma 
alias pr="prisma"

# Shortcuts
alias s="yarn start"
alias e="yarn electron-start"

alias cu="rm -rf node_modules && git checkout -f master"
alias gc="git clean -f"

# Docker
alias ds="docker stop (docker ps -q)"
function remove-containers
  docker stop (docker ps -aq)
  docker rm (docker ps -aq)
end

function docker-cleanup
  remove-containers
  docker network prune -f
  docker rmi -f (docker images --filter dangling=true -qa)
  docker volume rm (docker volume ls --filter dangling=true -q)
  docker rmi -f (docker images -qa)
end

# Fun stuff
alias brno="curl wttr.in/brno"
function weather 
  curl "wttr.in/$argv"
end
