echo "Custom bash aliases loaded."

# Docker aliases
alias docker_rmi='docker rmi -f $(docker images -q -a)'
alias docker_rmc='docker rm -f $(docker ps -a -q)'
alias docker_rmv='docker volume rm $(docker volume ls -q -f dangling=true)'
alias docker_stats='docker stats $(docker ps --format={{.Names}})'
alias docker_stop='docker stop $(docker ps -a -q)'
alias docker_reset='docker_stop;docker_rmc;docker_rmi;docker_rmv;'
alias dclear="docker stop \$(docker ps -aq); docker rm \$(docker ps -aq)"
function dsql {
  docker exec -it $1 mysql -uroot -padmin
}

function dbash {
  docker exec -it $1 bash
}

function devown {
  sudo chown developer $1; sudo chgrp developer $1
}

function buildbranch {
  local branch_name=$(git rev-parse --abbrev-ref HEAD)
  local last_commit=$(git rev-parse --short HEAD)
  git checkout -b "build-$branch_name-$last_commit"
}

# Navigation aliases
alias dev='cd /home/developer/Development'
alias ..='cd ..'
alias ...='cd ../../'

# Github aliases
alias g='git'
alias gs='git status'
alias gd='git diff '
alias gc='git checkout '
alias lastcommit='git rev-parse --short HEAD'

alias open='sensible-browser'

git config --global alias.co checkout

alias backupTilix='dconf dump /com/gexperts/Tilix/ > tilix.dconf'
alias loadTilix='dconf load /com/gexperts/Tilix/ < tilix.dconf'

alias openghadv='open https://github.com/Sage/sage_one_advanced'
alias openghui='open https://github.com/Sage/s1_gac_ui'

