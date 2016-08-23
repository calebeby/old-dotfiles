# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="calebeby"

HYPHEN_INSENSITIVE="true"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

#if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='nvim'
#else
#  export EDITOR='vim'
#fi

# Aliases

xset -b

export TERM=rxvt-unicode-256color

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
alias uninstall='yaourt -Rs'
alias remove='yaourt -Rs'
alias update='yaourt -Syu && yaourt -Su --aur; upgrade_oh_my_zsh'
# alias avg="for i in {1..10}; do /usr/bin/time -p $1; done 2>&1 | ag real | sed -e 's/real //' | awk '{sum += $1} END {print sum / NR}'"
alias avg="for i in {1..10}; do /usr/bin/time -p $1; done 2>&1 | ag real | sed -e 's/real //'"

export PATH="$PATH:$HOME/.rvm/bin:/usr/local/bin"
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_STYLE_OVERRIDE='gtk'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source $HOME/.rvm/scripts/rvm

# export rvmsudo_secure_path=1

# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
