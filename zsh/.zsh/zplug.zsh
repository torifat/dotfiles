# Plugins
zplug "supercrabtree/k"
zplug "djui/alias-tips"
zplug "b4b4r07/enhancd", use:init.sh
# zplug "plugins/git", from:oh-my-zsh, if:"(( $+commands[git] ))"
# npm run completion
zplug "akoenig/npm-run.plugin.zsh"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2 # Should be loaded 2nd last.
zplug "zsh-users/zsh-history-substring-search", defer:3 # Should be loaded last.
zplug "iam4x/zsh-iterm-touchbar"

setopt prompt_subst # Make sure prompt is able to be generated properly.
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
# zplug "yardnsm/blox-zsh-theme", as:theme
# zplug 'S1cK94/minimal', as:theme
