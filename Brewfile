cask_args appdir: '/Applications'

tap 'caskroom/cask'
tap 'homebrew/dupes'
tap 'Caskroom/versions'

brew 'curl', args: ['with-openssl', 'with-nghttp2']
# Install GNU core utilities (those that come with macOS are outdated).
brew 'coreutils'
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew 'findutils', args: ['with-default-names']
brew 'gnu-sed', args: ['with-default-names']
brew 'wget', args: ['with-iri']
brew 'tmux'

# Install more recent versions of some macOS tools.
brew 'vim', args: ['override-system-vi']
brew 'grep', args: ['with-default-names']
brew 'less', args: ['with-pcre']
brew 'openssh'

# ZSH related stuff
brew 'zsh'
brew 'zplug' #, args: ['with-zsh']

# Install other useful binaries.
brew 'ack'
brew 'dark-mode'
brew 'git'
brew 'imagemagick', args: ['with-webp']
brew 'tree'
brew 'youtube-dl'

# GUI Apps
cask 'iterm2'
cask 'hyperterm'
cask 'google-chrome'
cask 'atom'
# cask 'tower'
cask 'tower-beta'
cask '1password'
cask 'dropbox'
# cask 'slack'
cask 'slack-beta'
cask 'docker-beta'
cask 'istat-menus'
cask 'little-snitch'
cask 'spotify'
cask 'cleanmymac'
cask 'boom'
cask 'sketch'
cask 'navicat-for-mysql'
cask 'vlc'
cask 'paw'
cask 'skype'
cask 'utorrent'

# Non-essential Apps
cask 'airserver'
cask 'licecap'
cask 'numi'
cask 'steam'
cask 'codekit'
cask 'knuff'

# AppStore
mas 'Tweetbot', id: 557168941
mas 'Dash 3', id: 449589707
mas 'Kaleidoscope', id: 587512244
mas 'Sip', id: 507257563
mas 'DaisyDisk', id: 411643860

# Window Management [Choose One]
mas 'Magnet', id: 441258766
# mas 'Divvy', id: 413857545
# mas 'BetterSnapTool', id: 417375580

mas 'Keynote', id: 409183694
mas 'Pages', id: 409201541
mas 'Numbers', id: 409203825
