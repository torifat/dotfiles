zplug "supercrabtree/k"

zplug "b4b4r07/enhancd", \
  use:init.sh

zplug "plugins/git", \
  from:oh-my-zsh, \
  if:"(( $+commands[git] ))"

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", nice:18 # Should be loaded 2nd last.
zplug "zsh-users/zsh-history-substring-search", nice:19 # Should be loaded last.

setopt prompt_subst # Make sure prompt is able to be generated properly.
# zplug "adambiggs/zsh-theme", use:adambiggs.zsh-theme
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure", \
  use:pure.zsh, \
  on:"mafredri/zsh-async"
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf, use:\*darwin\*amd64\*
