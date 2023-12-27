# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Git
source ~/.zsh/git-prompt.sh
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# zplug
export ZPLUG_HOME=$(brew --prefix)/opt/zplug
if [[ -s "${ZPLUG_HOME}/init.zsh" ]]; then
  source "${ZPLUG_HOME}/init.zsh"
fi

# ngrok
if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

# pipx
if command -v pipx &>/dev/null; then
  autoload -U bashcompinit
  bashcompinit
  eval "$(register-python-argcomplete pipx)"
fi

# Alias
alias reload="source ~/.zshrc"

# grpcio
export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1
export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=1

# Environment

## OpenSSL
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib:$LDFLAGS"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include:$CPPFLAGS"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig:$PKG_CONFIG_PATH"

## curl
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/curl/lib:$LDFLAGS"
export CPPFLAGS="-I/opt/homebrew/opt/curl/include:$CPPFLAGS"

## zlib
export LDFLAGS="-L/opt/homebrew/opt/zlib/lib:$LDFLAGS"
export CPPFLAGS="-I/opt/homebrew/opt/zlib/include:$CPPFLAGS"
export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig:$PKG_CONFIG_PATH"

## Postgres
export PATH="/opt/homebrew/opt/postgresql@12/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@12/lib:$LDFLAGS"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@12/include:$CPPFLAGS"
export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@12/lib/pkgconfig:$PKG_CONFIG_PATH"

# Rust
source $HOME/.cargo/env

# Jetbrains
export PATH="/opt/jetbrains/bin:$PATH"

# anyenv
eval "$(anyenv init -)"
eval "$(anyenv init -)"

# go
export GOPATH="${HOME}/go"

# functions
function paws {
  local profile=$(perl -nle 'print $1 if /^[[](?:profile\s+)?([^]]+)/' ~/.aws/config | peco)
  if [ -n "$profile" ]; then
    AWS_PROFILE=$profile
    export AWS_PROFILE
    echo "AWS_PROFILE is now $AWS_PROFILE"
  fi
}

function pxcode {
  local xcode=$(ls /Applications/ | grep -E "^Xcode(\d)*(\..*)?(beta)?(\d)?\.app$" | peco)
  if [ -n "$xcode" ]; then
      sudo xcode-select -s "/Applications/$xcode/Contents/Developer"
      echo "DEVELOPER_DIR is now $xcode"
  fi
}

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
