# INSTRUCTIONS: Set inside ~/.zshrc
# source ~/dotfiles/zsh/alias.zsh

# ----- ZSH ----- 
alias zshConfig='nvim ~/.zshrc' 
alias execZsh='source ~/.zshrc'
alias execZshAlias='source ~/dotfiles/zsh/alias.zsh'
alias execBoth='source ~/.zshrc && source ~/dotfiles/zsh/alias.zsh'
alias themes='cd ~/.oh-my-zsh/themes'

# ----- GIT -----

alias gi='git init'
alias gb='git branch'
alias gbd='git branch -D'
alias giy='git init -y'
alias gaa='git add .'
alias gss='git status -s'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gp='git pull'
alias gpsh='git push origin head'
alias grh='git reset --hard HEAD'
alias grs='git reset --soft HEAD~1'

# ----- FILES (open) -----

alias o='open .'
alias ophp='open /Applications/MAMP/htdocs'
alias desktop='cd ~/Desktop'

# ----- FILES (show or hice) -----

alias showFiles='defaults write com.apple.Finder AppleShowAllFiles true && killall Finder'
alias hideFiles='defaults write com.apple.Finder AppleShowAllFiles false && killall Finder'
alias hideDesktop='defaults write com.apple.finder CreateDesktop false; killall Finder'
alias showDesktop='defaults write com.apple.finder CreateDesktop true; killall Finder'

# ----- MYSQL -----

alias mysqlConnection='mysql -u root -p'
alias mysqlStart='mysql.server start'
alias mysqlStop='mysql.server stop'
alias mysqlRestart='mysql.server restart'
alias mysqlStatus='mysql.server status'
alias mysqlPort='mysqladmin variables | grep port'

# ----- MYSQL v2 -----

alias mysqlConnection='mysql -u root'
alias mysqlStart='brew services start mysql'
alias mysqlStop='brew services stop mysql'

# ----- POSTGRESLQ -----

alias postgresqlStart='brew services start postgresql'
alias postgresqlStop='brew services stop postgresql'

# ----- VPN ----- 

alias configHost='code /etc/hosts'

# ----- SSH -----
# FIXME: The ssh alias is conflicting with the command to connect to servers
alias ssh='cd ~/.ssh/'

# ----- OPEN JAVA VERSION FILES -----
alias javaVersions='cd /Library/Java/JavaVirtualMachines'


# FIXME: is not showing alias from new location
# FUNCTION TO SHOW ALIASES
alias showAliases='cat ~/.zshrc | grep alias'

# ---- Eza (better ls) -----
alias ls="eza --color=always --long --icons=always --no-time --no-user --no-permissions"
