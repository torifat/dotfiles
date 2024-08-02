# Uncomment to profile ZSH
# zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# Install zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone --filter=blob:none https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Setup Theme
zi ice filter=blob:none
zi light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Bind Keys
# `cat -v` and type to get the codes
bindkey -d # Disable default keybindings
bindkey "\e[H" beginning-of-line # Fn+Left
bindkey "\e[F" end-of-line # Fn+Right
bindkey "\e\e[C" forward-word # Option+Right
bindkey "\e\e[D" backward-word # Option+Left
bindkey $terminfo[kcbt] reverse-menu-complete # Shift+Tab
bindkey $terminfo[kdch1] delete-char # Del = Fn+Backspace

# Autosuggestions & fast-syntax-highlighting
# -----------------------------------------------------------------------
zi wait lucid for \
   atinit'
      ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay;
      zstyle ":history-search-multi-word" page-size "11";
   ' \
      z-shell/F-Sy-H \
   blockf \
      zsh-users/zsh-completions \
   atload'!_zsh_autosuggest_start' \
      zsh-users/zsh-autosuggestions \
      z-shell/H-S-MW \
   atload'
      bindkey "^[[A" history-substring-search-up;
      bindkey "^[[B" history-substring-search-down;
   ' \
        zsh-users/zsh-history-substring-search

# zi wait"2" lucid for \
#   Aloxaf/fzf-tab

# LS Colors
zi ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
  atpull'%atclone' pick"clrs.zsh" nocompile'!' \
  atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zi light trapd00r/LS_COLORS

# Aliases
[ -f ~/.aliases ] && source ~/.aliases

# Private Stuff ;)
[ -f ~/.secret ] && source ~/.secret

# Load Shell Integrations
eval "$(fnm env --use-on-cd)"
eval "$(zoxide init --cmd cd zsh)"
#eval "$(fzf --zsh)"
eval "$(atuin init zsh)"

source ~/.afm-git-configrc

# Uncomment to profile ZSH
# zprof

# vim: ft=zsh sw=2 ts=2 et
