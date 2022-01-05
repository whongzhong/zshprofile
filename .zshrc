# .zshrc
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#
#module_path=~/local/zsh/lib/zsh/5.8
#export PATH=$HOME/local/zsh/bin:$PATH
#echo $module_path
fpath+=(~/local/zsh/themes/pure)

####################

# INSTALL STEPS

#1. install pure theme
# https://github.com/sindresorhus/pure
#2. install packages
# exa: https://the.exa.website/
# zsh-autosuggestions.zsh: https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#manual-git-clone
# zsh-syntax-highlighting: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md


####################

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/root/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/root/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/root/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/root/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# initialise nice autocompletion
autoload -U compinit && compinit

# install themes
autoload -U promptinit
promptinit


# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10
#
# # change the path color

# mod true color
#zmodload zsh/nearcolor

#
## # change the color for both `prompt:success` and `prompt:error`
##zstyle ':prompt:pure:prompt:*' color cyan
##
## # turn on git stash status
zstyle :prompt:pure:git:stash show yes

#true color
export COLORTERM=truecolor
zstyle :prompt:pure:user color '#a6db99'
zstyle :prompt:pure:host color '#a7bed3'
zstyle :prompt:pure:path color '#7fa6c3'
zstyle :prompt:pure:git color '#ffcaaf'
zstyle :prompt:pure:virtualenv color '#90d6c4'
zstyle ':prompt:pure:prompt:*' color '#7bcc8f'

prompt pure

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

# save command history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# close nomatch
setopt no_nomatch

# autoload -U colors
#colors
# plugins


# include exa
PATH=$PATH:$HOME/local/zsh/plugins/exa/bin:$HOME/local/bin
export PATH

source ~/local/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source ~/local/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh

# load colors and refresh
#autoload -U colors && colors
#setopt prompt_subst
