# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export TERM="xterm-256color"

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
plugins=(z brew zsh_reload)

source $ZSH/oh-my-zsh.sh
source /usr/local/bin/virtualenvwrapper.sh

# User configuration

DEFAULT_USER="$(whoami)"
BULLETTRAIN_PROMPT_ORDER=(
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
    prompt_segment $BULLETTRAIN_TIME_BG $BULLETTRAIN_TIME_FG $on
}

# aliases
alias globals='npm -g list --depth=0'
alias npm='nocorrect npm'
alias zshconfig='vim ~/.zshrc'
alias ohmyzsh='vim ~/.oh-my-zsh'
alias p='pianobar 2>/dev/null'
alias home='cd ~ && clear'
alias dc='docker-compose'

# functions
function cs () {
  cd "$@" && ls
}
