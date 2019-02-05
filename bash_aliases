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

rnt() {
  if [ -z "$2" ];
    then echo 'provide flag -i for improvements; -m for minor improvements; -b for bugs; -u for upgrade tasks';
  else
    renogen new S1T-$1;
    if [ $2 == "-i" ];
    then echo 'Improvements: "[S1T-'$1'](https://jira.sage.com/browse/S1T-'$1') - "' > './change_log/next/S1T-'$1'.yml';
    elif [ $2 == "-m" ];
    then echo 'Minor Improvements: "[S1T-'$1'](https://jira.sage.com/browse/S1T-'$1') - "' > './change_log/next/S1T-'$1'.yml';
    elif [ $2 == "-b" ];
    then echo 'Bugs: "[S1T-'$1'](https://jira.sage.com/browse/S1T-'$1') - "' > './change_log/next/S1T-'$1'.yml';
    elif [ $2 == "-u" ];
    then echo 'Upgrade Tasks: "[S1T-'$1'](https://jira.sage.com/browse/S1T-'$1') - "' > './change_log/next/S1T-'$1'.yml';
    fi

    vim -c 'startinsert' ./change_log/next/S1T-$1.yml;
    git add ./change_log/next/S1T-$1.yml;
    git commit -m 'S1T-'$1': Release notes';
    # git push;
  fi
}

rbms() {
  if [ -z "$1" ];
    then echo 'provide target branch';
  else
    echo 'Stashing ...'
    git stash;
    echo 'Get master ...'
    if [ -z "$2" ];
    then gc master; git pull origin master;
    else gc $2; git pull origin $2;
    fi
    echo 'Switch to branch ...'
    gc $1;
    echo 'Rebase ...'
    git rebase master;
    echo 'Unstash ...'
    git stash pop;
  fi
}
