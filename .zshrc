# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --------------------------------------------------------
# zsh options
# --------------------------------------------------------
setopt auto_cd
setopt correct
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history

# --------------------------------------------------------
# antidote
# --------------------------------------------------------
if [[ -f "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh" ]]; then
  source "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"
  antidote load "$HOME/.zsh_plugins.txt"
fi

# --------------------------------------------------------
# prompt
# --------------------------------------------------------
[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"

#--------------------------------------------------------
# asdf(arm64) / anyenv(x86_64)
#--------------------------------------------------------
# [ `uname -m` = 'arm64' ] && export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
# [ `uname -m` = 'x86_64' ] && eval "$(anyenv init -)"

#--------------------------------------------------------
# jump
#--------------------------------------------------------
# eval "$(jump shell)"

# --------------------------------------------------------
# paths
# --------------------------------------------------------
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export PATH="/opt/homebrew/opt/llvm@12/bin:$PATH"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
# see zprofile.

# --------------------------------------------------------
# env
# --------------------------------------------------------
if [[ -f "$HOME/.env" ]]; then
  set -a
  source "$HOME/.env"
  set +a
fi

#--------------------------------------------------------
# alias
#--------------------------------------------------------
alias la="ls -aFG"
alias ls="ls -FG"
alias ll="ls -alFG"

alias dc="docker compose"
alias dk="docker"

alias brewx="arch -x86_64 /usr/local/bin/brew"
alias dm="ruby $HOME/tools/bin/docker-manifest.rb"

alias flutter="fvm flutter"
alias dart="fvm dart"

alias emacs='emacsclient -t -a ""'
alias emt='emacsclient -nc -a ""'
alias emc='emacsclient -t -a ""'
export EDITOR='emacsclient -a ""'

alias rm="/opt/homebrew/bin/macrm"

alias claude-mem='bun "$HOME/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs"'

# --------------------------------------------------------
# functions
# --------------------------------------------------------
md() {
  open -a Typora "$1"
}

incremental_search_history() {
  local selected
  selected="$(history -E 1 | fzf | cut -b 26-)"
  BUFFER="${selected:-$BUFFER}"
  CURSOR=${#BUFFER}
  zle redisplay
}
zle -N incremental_search_history
bindkey "^R" incremental_search_history

# --------------------------------------------------------
# tools
# --------------------------------------------------------
[[ -f "$HOME/.ghcup/env" ]] && source "$HOME/.ghcup/env"

if command -v asdf >/dev/null 2>&1; then
  export JAVA_HOME="$(asdf where java 2>/dev/null)"
fi

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

if command -v jump >/dev/null 2>&1; then
  eval "$(jump shell)"
fi

if command -v zxcv >/dev/null 2>&1; then
  eval "$(zxcv init zsh)"
fi

# --------------------------------------------------------
# completions
# --------------------------------------------------------
[[ -f "$HOME/.dart-cli-completion/zsh-config.zsh" ]] && source "$HOME/.dart-cli-completion/zsh-config.zsh"
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

# Azure CLI completion: VS Codeで壊れやすいので必要な時だけ有効化推奨
# if command -v az >/dev/null 2>&1; then
#   autoload -Uz bashcompinit
#   bashcompinit
#   source "$(brew --prefix)/etc/bash_completion.d/az"
# fi
