export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_LS_COLORS="true"
ENABLE_CORRECTION="false"
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
plugins=(git macos zsh-autosuggestions vi-mode)
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
export EDITOR='vim'

# bindkey '^L' vi-forward-word
# bindkey '^k' up-line-or-search
# bindkey '^j' down-line-or-search
#
# You may need to manually set your language environment

alias la="tree -L 2"
alias lla=tree
alias cat=bat

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias cl='clear'

# HTTP requests with xh!
alias http="xh"

# VI Mode!!!
bindkey jj vi-cmd-mode

# FZF
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(thefuck --alias)"
eval "$(zoxide init zsh)"

export PATH=/opt/homebrew/bin:$PATH
export PATH="$PATH:~/.mybin"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
