# When GLOBAL_RCS is unset, /etc/zprofile, /etc/zshrc, /etc/zlogin and /etc/zlogout will not be sourced.
setopt no_global_rcs

# LANGUAGE must be set by en_US
export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

export TERM=xterm-256color

# Editor
export EDITOR=nvim
export GIT_EDITOR="${EDITOR}"

# Pager
export PAGER=less
# Less status line
# --SILENT : terminal bell is not rung
export LESS='--SILENT -R -f -X -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]'
export LESSCHARSET='utf-8'

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[00;44;37m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# History
# History file
export HISTFILE=~/.zsh_history
# History size in memory
export HISTSIZE=10000
# The number of histsize
export SAVEHIST=1000000
# The size of asking history
export LISTMAX=50
# Do not add in root
if [[ $UID == 0 ]]; then
    unset HISTFILE
    export SAVEHIST=0
fi

export LOCATE_PATH="~/.cache/locatedb"

# fnm
export FNM_COREPACK_ENABLED=true
export RUST_SRC_PATH=/usr/local/src/rust/src

# bun
export BUN_INSTALL="$HOME/.bun"

export PATH="/opt/homebrew/opt/findutils/libexec/gnubin::$PATH"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.cargo/bin:$HOME/.yarn/bin:/usr/local/bin:/usr/local/sbin:./node_modules/.bin:$HOME/.local/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$PATH:$HOME/dev/depot_tools"
export PATH="$PATH:/opt/atlassian/bin"

export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export SSH_AUTH_SOCK=~/.1password/agent.sock

# pnpm
export PNPM_HOME="/Users/rnabi/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
