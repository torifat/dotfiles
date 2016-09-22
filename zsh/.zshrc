# http://askubuntu.com/questions/44542/what-is-umask-and-how-does-it-work
umask 022
limit coredumpsize 0

fpath=(/usr/local/share/zsh-completions $fpath)
# autoload
autoload -Uz run-help
autoload -Uz add-zsh-hook
autoload -Uz colors && colors
autoload -Uz compinit && compinit -u
autoload -Uz is-at-least

# bind
bindkey -d
bindkey "\e[H" beginning-of-line # Fn+Left
bindkey "\e[F" end-of-line # Fn+Right
bindkey "\e\e[C" forward-word # Option+Right
bindkey "\e\e[D" backward-word # Option+Left
bindkey $terminfo[kcbt] reverse-menu-complete # Shift+Tab
bindkey $terminfo[kdch1] delete-char # Del

# automatically enter directories without cd
setopt auto_cd

## History
setopt append_history # Allow multiple terminal sessions to all append to one zsh command history
setopt hist_expire_dups_first # when trimming history, lose oldest duplicates first
setopt hist_ignore_dups # Do not write events to history that are duplicates of previous events
setopt hist_ignore_space # remove command line from history list when first character on the line is a space
setopt hist_find_no_dups # When searching history don't display results already cycled through twice
setopt hist_reduce_blanks # Remove extra blanks from each command line being added to history

# Exit if called from vim
[[ -n $VIMRUNTIME ]] && return

# ls color
if which dircolors > /dev/null 2>&1; then
  # export LS_COLORS
  eval $(dircolors -b)
  # #not use bold
  if which perl >/dev/null 2>&1 ;then
    LS_COLORS=$(echo $LS_COLORS | LANG=C perl -pe 's/(?<= [=;] ) 01 (?= [;:] )/00/xg')
  fi
else
  # dircolors is not found
  export LS_COLORS='di=00;34:ln=00;36:so=00;35:ex=00;32:bd=40;33;00:cd=40;33;00:su=37;41:sg=30;43:tw=30;42:ow=34;42'
fi
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# zplug
source $ZPLUG_HOME/init.zsh
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
zplug load --verbose

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# Bind UP and DOWN arrow keys for subsstring search.
if zplug check zsh-users/zsh-history-substring-search; then
  zmodload zsh/terminfo
  bindkey $terminfo[cuu1] history-substring-search-up
  bindkey $terminfo[cud1] history-substring-search-down
fi

if zplug check zsh-users/zsh-autosuggestions; then
  # Add history-substring-search-* widgets to list of widgets that clear the autosuggestion
  ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down)
  # Remove *-line-or-history widgets from list of widgets that clear the autosuggestion to avoid conflict with history-substring-search-* widgets
  ZSH_AUTOSUGGEST_CLEAR_WIDGETS=("${(@)ZSH_AUTOSUGGEST_CLEAR_WIDGETS:#(up|down)-line-or-history}")
fi

# export SEGMENT_SEPARATOR=$'\ue0c0'
