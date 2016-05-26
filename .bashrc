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
export EDITOR=nano

alias sshavail='cat ~/.ssh/config'
alias tailit='tail -f website/data/logs/php_errors'
alias startAccess="sh /web/vhosts/start_development_server.sh"
alias vssh="cd ~/vagrant/evanta_old && vagrant ssh"
alias server_start='sh ./server_start.sh'

alias rake!='rake db:drop && rake db:create'
alias raker!='bin/rake db:migrate RAILS_ENV=test'
alias l='ls -lah'
alias restartVirtualBox='sudo /Library/StartupItems/VirtualBox/VirtualBox restart'

# project shortcuts
alias bh="cd /web/vhosts/sandbox.bluehawk.evanta.com/website/"
alias api="cd /web/vhosts/EvantaAccessAPI"
alias ev="cd /web/vhosts/sandbox.evanta.com/"
alias tailBH="tail -f /web/vhosts/sandbox.bluehawk.evanta.com/website/data/logs/php_errors"

# edit this profile
alias profile="cat ~/.bash_profile"
function editProfile() {
  vim ~/.bash_profile
  source ~/.bash_profile
}

# Should allow you to run heroku rails tasks i.e. herokuu run rake db:migrate
function herokuu() {
  if [ ! "$1" ]
    then
      echo "The 'herokuu' command requires an option: 'herokuu logs', 'herokuu console', 'herokuu rake db:migrate'."
    else
      PS3="What application do you want to $@? "
      options=("api-eventbeyond" "stage-api-eventbeyond" "eventbeyond" "stage-eventbeyond" "admin-eventbeyond" "stage-admin-eventbeyond" "oldadmin-eventbeyond" "stage-oldadmin-eventbeyond" "Quit")
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
  heroku pg:backups capture --app api-eventbeyond
  curl -o ~/Desktop/latest.dump `heroku pg:backups public-url --app api-eventbeyond`
  rake db:drop
  rake db:create
  pg_restore --verbose --no-acl --no-owner -h localhost -d evanta365 ~/Desktop/latest.dump
  rake db:migrate
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

function ^() {
  if pwd == "/web/vhosts"
    then
      echo "true"
    else
      echo "false"
  fi
}


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


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

