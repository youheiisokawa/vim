#Application Shortcuts
alias safari='open -g -a safari'
alias skitch='open -g -a skitch'

# for Shortcut
alias up='cd ..'
alias upp='cd ../..'
alias uppp='cd ../../..'
alias ls='ls -GwF'
alias la='la -alh'
alias t='tar zxvf'
alias t-='tar xvf -'
alias b='bzip2 -dc'
alias dh='df -h'
alias vi='vim'
alias v='vim'
alias sr='screen -d -R'
alias grep='grep --exclude=*.svn*'
alias greprn='grep -rn --exclude=*.svn*'
alias bye='sudo shutdown -h now'

# for svn
alias st='svn st'
alias stu='svn st -u'
alias sd='svn di'
alias sdi='svn di'
alias sad='svn add'
alias sup='svn up'
alias sci='svn ci'
alias scim='svn ci -m'

# for git
alias gst='git status'
alias gci='git commit'
alias gdi='git diff'
alias gdc='git diff --cached'
alias gad='git add'

PS1="\n\`if [ \$? = 0 ]; then echo \[\e[32m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` (\h:\w)\n$ "

# add Path
export PATH=~/bin:$PATH
export PATH=/usr/local/sbin:$PATH # for Homebrew
export PATH=/usr/local/bin:$PATH  # for Homebrew
export PATH=~/.nodebrew/current/bin:$PATH  # for nodebrew

# for rbenv
eval "$(rbenv init -)"

