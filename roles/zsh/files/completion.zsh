# https://grml.org/zsh/zsh-lovers.html

# use a cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh

# fuzzy matching of completions for when you mistype them
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# ignore completion functions for commands you don't have
zstyle ':completion:*:functions' ignored-patterns '_*'

# if you end up using a directory as an argument, this will remove the trailing slash
zstyle ':completion:*' squeeze-slashes true

# cd will never select the parent directory
zstyle ':completion:*:cd:*' ignore-parents parent pwd
