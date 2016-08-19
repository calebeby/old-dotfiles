# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="calebeby"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyph en-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
 HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

#  export PATH="/usr/local/heroku/bin:/home/caleb/.dropbox-bin:/home/caleb/.rvm/gems/ruby-2.3.0/bin:/home/caleb/.rvm/gems/ruby-2.3.0@global/bin:/home/caleb/.rvm/rubies/ruby-2.3.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/caleb/.rvm/bin:/home/caleb/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
#export LANG=en_US.UTF-8
#export LC_MESSAGES="C"

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='nvim'
#else
#  export EDITOR='vim'
#fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Aliases

xset -b

export TERM=xterm-256color
alias p="~/Podcasts/bashpodder.sh && ~/Podcasts/speedup.sh"
alias t="~/Podcasts/transfer.sh"
alias cat='fun () {highlight -O ansi -i $1 2>/dev/null || command cat $1;}; fun'
alias apt-get="sudo apt-get"
alias dotbot='~/dotfiles/install -d ~/dotfiles/'
alias cp='cp --verbose'
alias rerun='~/dotfiles/rerun'
alias ls='ls -v --color=tty'
alias busy="cat /dev/urandom | hexdump -C | ag --color 'ce e'"
alias mm="bundle exec middleman"
alias gs="hub status"
alias e="if [ -s Session.vim ] ; then; nvim -S; else; nvim; fi"
alias b='sudo halt -p'
alias ag='ag --path-to-agignore ~/.agignore --hidden'
alias work='tmux attach -t'
alias install='yaourt -S'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/usr/local/bin"
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_STYLE_OVERRIDE='gtk'
# export NVIM_TUI_ENABLE_CURSOR_SHAPE='1'

#export PATH=$PATH:/usr/local/go/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source $HOME/.rvm/scripts/rvm
export rvmsudo_secure_path=1
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias g='hub'

alias ga='hub add'
alias gaa='hub add --all'
alias gapa='hub add --patch'

alias gb='hub branch'
alias gba='hub branch -a'
alias gbda='hub branch --no-color --merged | command grep -vE "^(\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 hub branch -d'
alias gbl='hub blame -b -w'
alias gbnm='hub branch --no-merged'
alias gbr='hub branch --remote'
alias gbs='hub bisect'
alias gbsb='hub bisect bad'
alias gbsg='hub bisect good'
alias gbsr='hub bisect reset'
alias gbss='hub bisect start'

alias gc='hub commit -v'
alias gc!='hub commit -v --amend'
alias gcn!='hub commit -v --no-edit --amend'
alias gca='hub commit -v -a'
alias gca!='hub commit -v -a --amend'
alias gcan!='hub commit -v -a --no-edit --amend'
alias gcans!='hub commit -v -a -s --no-edit --amend'
alias gcam='hub commit -a -m'
alias gcb='hub checkout -b'
alias gcf='hub config --list'
alias gcl='hub clone --recursive'
alias gclean='hub clean -fd'
alias gpristine='hub reset --hard && hub clean -dfx'
alias gcm='hub checkout master'
alias gcmsg='hub commit -m'
alias gco='hub checkout'
alias gcount='hub shortlog -sn'
compdef gcount=hub
alias gcp='hub cherry-pick'
alias gcs='hub commit -S'

alias gd='hub diff'
alias gdca='hub diff --cached'
alias gdct='hub describe --tags `hub rev-list --tags --max-count=1`'
alias gdt='hub diff-tree --no-commit-id --name-only -r'
alias gdw='hub diff --word-diff'

gdv() { hub diff -w "$@" | view - }
compdef _hub gdv=hub-diff

alias gf='hub fetch'
alias gfa='hub fetch --all --prune'
alias gfo='hub fetch origin'

function gfg() { hub ls-files | grep $@ }
compdef _grep gfg

alias gg='hub gui citool'
alias gga='hub gui citool --amend'

ggf() {
  [[ "$#" != 1 ]] && local b="$(git_current_branch)"
  hub push --force origin "${b:=$1}"
}
compdef _hub ggf=hub-checkout

ggl() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    hub pull origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    hub pull origin "${b:=$1}"
  fi
}
compdef _hub ggl=hub-checkout

ggp() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    hub push origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    hub push origin "${b:=$1}"
  fi
}
compdef _hub ggp=hub-checkout

ggpnp() {
  if [[ "$#" == 0 ]]; then
    ggl && ggp
  else
    ggl "${*}" && ggp "${*}"
  fi
}
compdef _hub ggpnp=hub-checkout

ggu() {
  [[ "$#" != 1 ]] && local b="$(git_current_branch)"
  hub pull --rebase origin "${b:=$1}"
}
compdef _hub ggu=hub-checkout

alias ggpur='ggu'
compdef _hub ggpur=hub-checkout

alias ggpull='hub pull origin $(git_current_branch)'
compdef _hub ggpull=hub-checkout

alias ggpush='hub push origin $(git_current_branch)'
compdef _hub ggpush=hub-checkout

alias ggsup='hub branch --set-upstream-to=origin/$(git_current_branch)'

alias gpsup='hub push --set-upstream origin $(git_current_branch)'

alias gignore='hub update-index --assume-unchanged'
alias gignored='hub ls-files -v | grep "^[[:lower:]]"'
alias hub-svn-dcommit-push='hub svn dcommit && hub push github master:svntrunk'
compdef hub-svn-dcommit-push=hub

alias gk='\hubk --all --branches'
compdef _hub gk='hubk'
alias gke='\hubk --all $(hub log -g --pretty=format:%h)'
compdef _hub gke='hubk'

alias gl='hub pull'
alias glg='hub log --stat'
alias glgp='hub log --stat -p'
alias glgg='hub log --graph'
alias glgga='hub log --graph --decorate --all'
alias glgm='hub log --graph --max-count=10'
alias glo='hub log --oneline --decorate'
alias glol="hub log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glola="hub log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
alias glog='hub log --oneline --decorate --graph'
alias gloga='hub log --oneline --decorate --graph --all'
alias glp="_hub_log_prettily"
compdef _hub glp=hub-log

alias gm='hub merge'
alias gmom='hub merge origin/master'
alias gmt='hub mergetool --no-prompt'
alias gmtvim='hub mergetool --no-prompt --tool=vimdiff'
alias gmum='hub merge upstream/master'

alias gp='hub push'
alias gpd='hub push --dry-run'
alias gpoat='hub push origin --all && hub push origin --tags'
compdef _hub gpoat=hub-push
alias gpu='hub push upstream'
alias gpv='hub push -v'

alias gr='hub remote'
alias gra='hub remote add'
alias grb='hub rebase'
alias grba='hub rebase --abort'
alias grbc='hub rebase --continue'
alias grbi='hub rebase -i'
alias grbm='hub rebase master'
alias grbs='hub rebase --skip'
alias grh='hub reset HEAD'
alias grhh='hub reset HEAD --hard'
alias grmv='hub remote rename'
alias grrm='hub remote remove'
alias grset='hub remote set-url'
alias grt='cd $(hub rev-parse --show-toplevel || echo ".")'
alias gru='hub reset --'
alias grup='hub remote update'
alias grv='hub remote -v'

alias gsb='hub status -sb'
alias gsd='hub svn dcommit'
alias gsi='hub submodule init'
alias gsps='hub show --pretty=short --show-signature'
alias gsr='hub svn rebase'
alias gss='hub status -s'
alias gst='hub status'
alias gsta='hub stash save'
alias gstaa='hub stash apply'
alias gstd='hub stash drop'
alias gstl='hub stash list'
alias gstp='hub stash pop'
alias gsts='hub stash show --text'
alias gsu='hub submodule update'

alias gts='hub tag -s'
alias gtv='hub tag | sort -V'

alias gunignore='hub update-index --no-assume-unchanged'
alias gunwip='hub log -n 1 | grep -q -c "\-\-wip\-\-" && hub reset HEAD~1'
alias gup='hub pull --rebase'
alias gupv='hub pull --rebase -v'
alias glum='hub pull upstream master'

alias gwch='hub whatchanged -p --abbrev-commit --pretty=medium'
alias gwip='hub add -A; hub rm $(hub ls-files --deleted) 2> /dev/null; hub commit -m "--wip--"'

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

