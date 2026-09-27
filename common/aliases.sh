# Shared by bash (Omarchy) and zsh (macOS).

# Listing: eza when available (Omarchy has it; brew install eza on macOS)
if command -v eza >/dev/null 2>&1; then
  alias l='eza -lh --group-directories-first --icons=auto'
else
  alias l='ls -lh'
fi
alias ll='l'
alias la='l -a'

# Git (ga/gd are left alone: they are Omarchy's worktree helpers)
alias g='git'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'
alias gs='git status -sb'
alias gdf='git diff'
alias gds='git diff --staged'
alias gaa='git add -A'
alias gap='git add -p'
alias gco='git checkout'
alias gsw='git switch'
alias gb='git branch'
alias gl='git log --oneline --graph --decorate -20'
alias gla='git log --oneline --graph --decorate --all'
alias gf='git fetch'
alias gp='git push'
alias gpl='git pull'
alias gst='git stash'
alias gstp='git stash pop'
alias grs='git restore'

# GitHub CLI shortcuts (gh aliases live in ~/.config/gh/config.yml)
alias ghc='gh clone'
alias ghp='gh prc && gh ck'
