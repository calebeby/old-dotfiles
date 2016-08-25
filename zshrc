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

# Disable beep
xset -b

# Show contents of directory after cd-ing into it
chpwd() {
  ls -v --color=tty
}

# Save a ton of history
HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=20000

export TERM=rxvt-unicode-256color

# Aliases

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
alias alert='notify-send -i urxvt "[$?] $(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/;\s*alert$//'\'')"'
# alias avg="for i in {1..10}; do /usr/bin/time -p $1; done 2>&1 | ag real | sed -e 's/real //' | awk '{sum += $1} END {print sum / NR}'"
alias avg="for i in {1..10}; do /usr/bin/time -p $1; done 2>&1 | ag real | sed -e 's/real //'"
alias time='/usr/bin/time'

# http://askubuntu.com/questions/409611/desktop-notification-when-long-running-commands-complete
trap '_start=$SECONDS' DEBUG

export PATH="$PATH:$HOME/.rvm/bin:/usr/local/bin"
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_STYLE_OVERRIDE='gtk'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source $HOME/.rvm/scripts/rvm

# export rvmsudo_secure_path=1

# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
preexec () {
    # Note the date when the command started, in unix time.
    CMD_START_DATE=$(date +%s)
    # Store the command that we're running.
    CMD_NAME=$1
}
precmd () {
    # Proceed only if we've ran a command in the current shell.
    if ! [[ -z $CMD_START_DATE ]]; then
        # Note current date in unix time
        CMD_END_DATE=$(date +%s)
        # Store the difference between the last command start date vs. current date.
        CMD_ELAPSED_TIME=$(($CMD_END_DATE - $CMD_START_DATE))
        # Store an arbitrary threshold, in seconds.
        CMD_NOTIFY_THRESHOLD=5
        commands=(nvim tmux)

        if [[ $CMD_ELAPSED_TIME -gt $CMD_NOTIFY_THRESHOLD ]]; then
          if [[ ${commands[(r)b]} == b ]]; then
            # Send a notification
            notify-send "Task Finished" "\"$CMD_NAME\""
          fi
        fi
    fi
}
