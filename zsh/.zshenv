# When GLOBAL_RCS is unset, /etc/zprofile, /etc/zshrc, /etc/zlogin and /etc/zlogout will not be sourced.
setopt no_global_rcs

# LANGUAGE must be set by en_US
export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

export TERM=xterm-256color

# Editor
export EDITOR=vim
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

# ls command colors
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# enhancd
export ENHANCD_DISABLE_DOT=1
export ENHANCD_DISABLE_HYPHEN=1

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

# Curl
# export CURL_CA_BUNDLE='/usr/local/share/curl/curl-ca-bundle.crt'

# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
export ZPLUG_REPOS=$HOME/.zplug/repos
export ZPLUG_LOADFILE="$HOME/.zsh/zplug.zsh"

# Add coreutils to PATH
export PATH="$HOME/.cargo/bin:$HOME/.yarn/bin:/usr/local/bin:/usr/local/sbin:./node_modules/.bin:$PATH"
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"

export RUST_SRC_PATH=/usr/local/src/rust/src
