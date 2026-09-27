# Listing (ls is Omarchy's eza -lh)
alias l='ls'
alias ll='ls'
alias la='ls -a'

# Git (ga/gd are Omarchy worktree helpers; gcm/gcam/gcad already exist)
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
