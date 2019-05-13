# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export TERM="xterm-256color"
export PATH="/usr/local/opt/node@10/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/Users/sgourley/dev/google-vote-skill/dev:$PATH"

# Path to your oh-my-zsh installation. 
export ZSH=/Users/sgourley/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bullet-train"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(z brew zsh_reload kubectl zsh-nvm)

source $ZSH/oh-my-zsh.sh
source /usr/local/bin/virtualenvwrapper.sh

# User configuration

DEFAULT_USER="$(whoami)"
BULLETTRAIN_PROMPT_ORDER=(
  time
  uptime
  status
  custom
  context
  dir
  perl
  ruby
  virtualenv
  nvm
  go
  git
  hg
  cmd_exec_time
)

prompt_uptime(){
    on=${${${(s: :)"$(uptime)"}[3]}%,}
    prompt_segment $BULLETTRAIN_TIME_BG $BULLETTRAIN_TIME_FG "[$on]"
}
# envs
export DOTNET_CLI_TELEMETRY_OPTOUT=true

# aliases
alias globals='npm -g list --depth=0'
# alias npm='nocorrect npm'
alias zshconfig='vim ~/.zshrc'
alias ohmyzsh='vim ~/.oh-my-zsh'
alias p='pianobar 2>/dev/null'
alias home='deactivate; cd ~; clear'
alias dc='docker-compose'
alias sgid-index='>&2 echo "starting sgid index update" && workon gis.utah.gov && >&2 echo "switching to master branch" && git checkout master && >&2 echo "updating from remote" && git up && >&2 echo "running python" && python datatable.py
if git commit -am ":package: update sgid-index"
then git push
fi
>&2 echo "done" && deactivate && cd ~/'
alias g='grunt'
alias docker-rmi='docker images -aq -f dangling=true | xargs docker rmi'
alias docker-rmc='docker ps -aq | xargs docker rm'
alias docker-kill='docker ps -aq | xargs docker kill'
alias docker-update-images='docker images |grep -v REPOSITORY|awk '{print $1}'|xargs -L1 docker pull'
# functions
function cs () {
  cd "$@" && ls
}
function mkcdir () {
  mkdir -p -- "$1" && cd -P -- "$1"
}
GPG_TTY=$(tty)
export GPG_TTY

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
export PATH="/usr/local/sbin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sgourley/dev/clones/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/sgourley/dev/clones/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/sgourley/dev/clones/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/sgourley/dev/clones/google-cloud-sdk/completion.zsh.inc'; fi
