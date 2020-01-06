source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

export PS1="Loading..."

# Bind Keys
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

# iTerm2 Shell Integration
[ -f ~/.iterm2_shell_integration.zsh ] && source ~/.iterm2_shell_integration.zsh

# Exit if called from vim
[[ -n $VIMRUNTIME ]] && return

# Sane ZSH options
# https://github.com/willghatch/zsh-saneopt/blob/master/saneopt.plugin.zsh
zplugin load willghatch/zsh-saneopt

# Theme
# -----------------------------------------------------------------------
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# After finishing the configuration wizard change the atload'' ice to:
# -> atload"source ~/.p10k.zsh; _p9k_precmd"
# Before install
# <- atload"true; _p9k_precmd"
zplugin ice wait"!" lucid atload"source ~/.p10k.zsh; _p9k_precmd" nocd
zplugin load romkatv/powerlevel10k
# -----------------------------------------------------------------------

zplugin ice wait"1" lucid
zplugin load "chriskempson/base16-shell"

# diff-so-fancy
zplugin ice wait"2" lucid as"program" pick"bin/git-dsf"
zplugin load zdharma/zsh-diff-so-fancy

# Emoji
zplugin ice wait"2" lucid
zplugin load 'wfxr/emoji-cli'

# forgit
zplugin ice wait"2" lucid
zplugin load 'wfxr/forgit'

# zsh-autopair
zplugin ice wait"2" lucid
zplugin load hlissner/zsh-autopair

# Tips
zplugin ice wait"2" lucid
zplugin load djui/alias-tips
# zplugin load molovo/tipz

# Autosuggestions & fast-syntax-highlighting
# -----------------------------------------------------------------------
zplugin ice wait"3" lucid atinit"ZPLGM[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zplugin load zdharma/fast-syntax-highlighting

# zsh-autosuggestions
zplugin ice wait"2" lucid atload"!_zsh_autosuggest_start"
zplugin load zsh-users/zsh-autosuggestions

# zdharma/history-search-multi-word
zstyle ":history-search-multi-word" page-size "11"
zplugin ice wait"2" lucid
zplugin load zdharma/history-search-multi-word

zplugin ice wait"2" lucid blockf atpull'zplugin creinstall -q .'
zplugin load zsh-users/zsh-completions

# wait0 cause usually this is the first thing I do after starting a terminal
zplugin ice wait"0" lucid
zplugin load "b4b4r07/enhancd"
zplugin ice wait"1" lucid
zplugin load "changyuheng/zsh-interactive-cd"

# LS Colors
zplugin ice wait"2" lucid \
  atclone"dircolors -b LS_COLORS > ls_colors.zsh" \
  atpull"%atclone" pick"ls_colors.zsh"
zplugin load trapd00r/LS_COLORS
# -----------------------------------------------------------------------

