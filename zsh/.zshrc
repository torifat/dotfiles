source "$HOME/.zinit/bin/zplugin.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

export PS1=""

# Bind Keys
# `cat -v` and type to get the codes
bindkey -d
bindkey "\e[H" beginning-of-line # Fn+Left
bindkey "\e[F" end-of-line # Fn+Right
bindkey "\e\e[C" forward-word # Option+Right
bindkey "\e\e[D" backward-word # Option+Left
bindkey $terminfo[kcbt] reverse-menu-complete # Shift+Tab
bindkey $terminfo[kdch1] delete-char # Del

# Automatically enter directories without cd
setopt auto_cd

# No Beep
setopt no_beep
setopt no_list_beep
setopt no_hist_beep

# Expand '=command' as path of command
# e.g.) '=ls' -> '/bin/ls'
setopt equals

## History
# Share history
setopt share_history
# Add comamnds as they are typed, don't wait until shell exit
# setopt inc_append_history
# Do not write events to history that are duplicates of previous events
setopt hist_ignore_dups
# When trimming history, lose oldest duplicates first
setopt hist_expire_dups_first
# Remove extra blanks from each command line being added to history
setopt hist_reduce_blanks
# Record start and end time to history file
setopt extended_history
# Ignore the beginning space command to history file
setopt hist_ignore_space
# Append to history file
setopt append_history
# Edit history file during call history before executing
setopt hist_verify
# Enable history system like a Bash
setopt bang_hist

# Don't add wrong commands to history
zshaddhistory() {
	whence ${${(z)1}[1]} >| /dev/null || return 1 }

# Aliases
[ -f ~/.aliases ] && source ~/.aliases

# Private Stuff ;)
[ -f ~/.secret ] && source ~/.secret

# Exit if called from vim
[[ -n $VIMRUNTIME ]] && return

# Sane ZSH options
# https://github.com/willghatch/zsh-saneopt/blob/master/saneopt.plugin.zsh
zinit light willghatch/zsh-saneopt

# Theme
# -----------------------------------------------------------------------
# zinit ice depth"1"
# zpl light romkatv/zsh-defer

typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# After finishing the configuration wizard change the atload'' ice to:
# -> atload"source ~/.p10k.zsh; _p9k_precmd"
# Before install
# <- atload"true; _p9k_precmd"
zinit ice wait"!" lucid atload"source ~/.p10k.zsh; _p9k_precmd" nocd
zinit load romkatv/powerlevel10k
# -----------------------------------------------------------------------

zinit ice wait"1" lucid
zinit load "chriskempson/base16-shell"

# diff-so-fancy
zinit ice wait"2" lucid as"program" pick"bin/git-dsf"
zinit load zdharma/zsh-diff-so-fancy

# Emoji
zinit ice wait"2" lucid
zinit load 'wfxr/emoji-cli'

# forgit
zinit ice wait"2" lucid
zinit load 'wfxr/forgit'

# zsh-autopair
zinit ice wait"2" lucid
zinit load hlissner/zsh-autopair

# Tips
zinit ice wait"2" lucid
zinit load djui/alias-tips
# zinit load molovo/tipz

# Autosuggestions & fast-syntax-highlighting
# -----------------------------------------------------------------------
zinit ice wait"3" lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zinit load zdharma/fast-syntax-highlighting

# zsh-autosuggestions
zinit ice wait"2" lucid atload"!_zsh_autosuggest_start"
zinit load zsh-users/zsh-autosuggestions

# zsh-zsh-history-substring-search
zinit ice wait"1" lucid
zinit load zsh-users/zsh-history-substring-search

# zdharma/history-search-multi-word
zstyle ":history-search-multi-word" page-size "11"
zinit ice wait"2" lucid
zinit load zdharma/history-search-multi-word

zinit ice wait"2" lucid blockf atpull'zinit creinstall -q .'
zinit load zsh-users/zsh-completions

# wait0 cause usually this is the first thing I do after starting a terminal
zinit ice wait"0" lucid
zinit load "b4b4r07/enhancd"
zinit ice wait"1" lucid
zinit load "changyuheng/zsh-interactive-cd"

# LS Colors
zinit ice wait"2" lucid \
  atclone"dircolors -b LS_COLORS > ls_colors.zsh" \
  atpull"%atclone" pick"ls_colors.zsh"
zinit load trapd00r/LS_COLORS

# n
zinit ice wait"2" lucid
zinit load gretzky/n.zsh

# Should be after loading the plugins
# Bind UP and DOWN arrow keys for subsstring search.
bindkey "\e[A" history-substring-search-up
bindkey "\e[B" history-substring-search-down


# -----------------------------------------------------------------------

source ~/Library/Preferences/org.dystroy.broot/launcher/bash/br
