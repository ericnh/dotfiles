# evil mode
set -o vi
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# from bash_profile
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:$PATH"
export TEST_CLUSTER_PORT="9250"
export TEST_CLUSTER_NAME="erichalstead_test"

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
function ruby_version() {
  rvm current
}
export PG_DUMP="/Applications/Postgres.app/Contents/Versions/9.4/bin/"
PATH=$PG_DUMP:$PATH
function git_branch() {
  branch=$(git branch 2>/dev/null | cut -d' ' -f2)
  if [ "$?" == "0" ]; then echo $branch; fi
}

PS1='\[\e[00;36m\]\W\[\e[0m\][\[\e[00;32m\]$(git_branch)\[\e[0m\]]$ '

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=vim
# export GIT_EDITOR="mvim -f"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias sshavail='cat ~/.ssh/config'
alias tailit='tail -f website/data/logs/php_errors'
alias startAccess="sh /web/vhosts/start_development_server.sh"
alias vssh="cd ~/vagrant/evanta_old && vagrant ssh"
alias server_start='sh ./server_start.sh'
alias ss='sh ./server_start.sh'
alias ussr='sh ./server_start.sh'

alias rake!='rake db:drop && rake db:create'
alias raker!='bin/rake db:migrate RAILS_ENV=test'
alias l='ls -lah'
alias ll='l | less'
alias restartVirtualBox='sudo /Library/StartupItems/VirtualBox/VirtualBox restart'

# project shortcuts
alias bh="cd /web/vhosts/sandbox.bluehawk.evanta.com/website/"
alias tailBH="tail -f /web/vhosts/sandbox.bluehawk.evanta.com/website/data/logs/php_errors"

# edit this profile
alias profile="less ~/.bashrc"
function edit_profile() {
  vim ~/.bashrc
  source ~/.bashrc
}

# connect to local, stage, and prod dbs using pgcli
function local_db() {
  pgcli evanta365
}
function stage_db() {
  pgcli -h ec2-54-225-90-104.compute-1.amazonaws.com -p 5472 -U u3s7dic324gu6p -d d4ar0jetqtd0qp -W pdkjtcdh8o6b8g8atn2nehlus56
}

# Should allow you to run heroku rails tasks i.e. herokuu run rake db:migrate
function herokuuu:() {
  if [ ! "$1" ]
    then
      echo "The 'herokuu' command requires an option: 'herokuu logs', 'herokuu console', 'herokuu rake db:migrate'."
    else
      PS3="What application do you want to $@? "
      options=("api-eventbeyond" "stage-api-eventbeyond" "eventbeyond" "stage-eventbeyond" "admin-eventbeyond" "stage-admin-eventbeyond" "oldadmin-eventbeyond" "stage-oldadmin-eventbeyond" "api-lms" "stage-api-lms" "Quit")
      run = true
      select opt in "${options[@]}"
      do
          case $opt in
              "Quit")
                  break
                  ;;
              *);;
          esac
          case $1 in
            "console" ) heroku run rails console --app $opt;;
            "logs" ) heroku logs --tail --app $opt;;
            *) heroku run $@ --app $opt;;
          esac
          herokuu $@
          break
      done
  fi
}

function pull_db() {
  cd /web/vhosts/eventbeyond_api
  # if you pass in any given argument then it will pull down a new dump
  if [ $1 ]
  then
    heroku pg:backups capture --app api-eventbeyond
    curl -o /web/vhosts/eventbeyond_api/latest.dump `heroku pg:backups public-url --app api-eventbeyond`
  fi
  rake db:drop
  rake db:create
  pg_restore --verbose --no-acl --no-owner -h localhost -d evanta365 /web/vhosts/eventbeyond_api/latest.dump
  rake db:migrate
}

function make_note() {
  vim ~/notes/$1
}

function heroku_stage() {
  git checkout develop &&
  git pull origin develop &&
  git checkout heroku_stage &&
  git pull origin heroku_stage &&
  git merge develop &&
  git push origin heroku_stage &&
  git checkout develop 
}

function prod_diff() {
  git checkout develop &&
  git pull origin develop &&
  git difftool origin/heroku_production develop
}
function stage_diff() {
  git checkout develop &&
  git pull origin develop &&
  git difftool origin/heroku_stage develop
}

function read_md() {
  pandoc $1 | lynx -stdin
}

alias reset_stage_lms_database='heroku pg:reset DATABASE_URL --app stage-api-lms --confirm stage-api-lms; heroku run rake newclear --app stage-api-lms;'

export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

# git tab completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
