# Created by Yuhiisk for 5.0.5

## Environment variable configuration

#
# LANG
#
export LANG=ja_JP.UTF-8
# ["0"=$UID] && LANG=en_US.UTF-8

## Default shell configuration
#
# auto change directory
#
setopt auto_cd

# autodirectory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep

## Keybind configuration
#
# emacs like keybind(e.x. Ctrl-a gets to line head and Ctrl-e gets
#  to end) and something additions
#
bindkey -e
bindkey "^[[1~" beginning-of-line # Home gets to line head
bindkey "^[[4~" end-of-line # End gets to line end
bindkey "^[[3~" delete-char # Del

# historical backward/forward search with linehead string binded to ^P/^N
# incremental backward/forward search with pattern string binded to ^R/^S
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end
bindkey "^r" history-incremental-pattern-search-backward
bindkey "^s" history-incremental-pattern-search-forward

# reverse menu completion binded to Shift-Tab
#
bindkey "\e[Z" reverse-menu-complete

## Command history configuration
#
HISTFILE=$HOME/.zsh_history
HISTSIZE=3000
SAVEHIST=3000
setopt hist_ignore_dups #ignore duplication command history list
setopt share_history # share command history data

## Completion configuration
#
fpath=($HOME/.zsh/functions/Completion $fpath)
autoload -U compinit
compinit

## zsh editor
#
autoload zed

## Prediction configuration
#
#autoload predict-on
#predict-off

## Alias configuration
#
# expand aliases before completing
#
case $OSTYPE in
	freebsd*|darwin*)
		alias ls="ls -G -w"
		;;
	linux*)
		alias ls="ls --color"
		;;
esac
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias less="lexx -X"

alias du="du -h"
alias df="df -h"

alias su="su -l"

## terminal configuration
#
# undef stop/start cchar for some applications to use C-s/C-q as their keybind
stty start undef
stty stop undef

case $TERM in
	xterm*)
		export LSCOLORS=cxFxCxdxBxegedabagacad
		export LS_COLORS='di=32:ln=35:so=01:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
		zstyle ':completion:*' list-colors 'di=32' 'ln=35' 'ex=31' 'bd=46;34' 'cd=43;34'
		;;
	kterm-color)
		stty erase '^H'
		export LSCOLORS=cxFxCxdxBxegedabagacad
		export LS_COLORS='di=32:ln=35:so=01:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
		zstyle ':completion:*' list-colors 'di=32' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
		;;
	kterm)
		stty erase '^H'
		;;
	cons25)
		unset LANG
		export LSCOLORS=csFxCxdxBxegedabagacad
		export LS_COLORS='di=01;32:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42:30:ow=43;30'
		zstyle ':completion:*' list-colors 'di=;32;1' 'ln-;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
		;;
	jfbterm-color)
		export LSCOLORS=cxFxCxdxBxegedabagacad
		export LS_COLORS='di=01;32:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:sg=46:30:tw=42;30:ow=43;30'
		zstyle ':completion:*' list-colors 'di=;32;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
		;;
	*)
		export LSCOLORS=cxFxCxdxBxegedabagacad
		export LS_COLORS='di=32:ln=35:so=01:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
		zstyle ':completion:*' list-colors 'di=32' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
		;;
esac

# set prompt
#
case $TERM in
	xterm*)
		autoload colors
		colors
		updateprompt() {
			case ${UID} in
				0)
					PROMPT="%{${fg_bold[red]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %B%{${fg[red]}%}%$(($COLOMNS * 4 / 10))<...<%d#%{${reset_color}%}%b "
					PROMPT2="%B%{${fg_bold[red]}%}%_#%{${reset_color}%}%b "
					SPROMPT="%B%{${fg_bold[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
					;;
				*)
					PROMPT="%{${fg_bold[default]}%}%$(($COLUMNS * 5 / 10))<...<%d%%%{${reset_color}%} "
					[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
					PROMPT="%{${fg_bold[default]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %$(($COLUMNS * 4 / 10))<...<%{${fg_bold[default]}%}%d%%%{${reset_color}%} "
					PROMPT2="%{${fg_bold[default]}%}%_%%%{${reset_color}%} "
					SPROMPT="%{${fg_bold[default]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
					;;
			esac
		}
		TRAPWINCH() {
			updateprompt
		}

		# first fire
		updateprompt
		;;
esac

# VCSの情報を取得するzshの便利関数 vcs_infoを使う
autoload -Uz vcs_info

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
RPROMPT="%1(v|%F{green}%1v%f|)"

## load user .aliases and .zshrc configuration file
#
[ -f $HOME/.aliases ] && source $HOME/.aliases
