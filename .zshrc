# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git macos docker zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

unsetopt share_history

# User configuration

bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

export CLICOLOR=1
export SVN_EDITOR=vim
export GIT_EDITOR=vim
export PYTHONIOENCODING=UTF-8
export CC=clang
export CXX=clang++
export C_INCLUDE_PATH=$HOME/.local/include
export CPLUS_INCLUDE_PATH=$HOME/.local/include
export LD_LIBRARY_PATH="$HOME/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/clang/lib/:$LD_LIBRARY_PATH"

if [ `uname` = 'Linux' ]; then
  # enable color support of ls and also add handy aliases
  if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
  fi

#  export LD_LIBRARY_PATH=".:$HOME/.local/bin:$HOME/usr/lib:/usr/local/lib:/usr/lib:/usr/local/lib64:/usr/lib64:/home/khheo/.linuxbrew/lib:/usr/lib/x86_64-linux-gnu/"
  export LD_LIBRARY_PATH=".:$HOME/.local/bin:$HOME/usr/lib:/usr/local/lib:/usr/lib:/usr/local/lib64:/usr/lib64:/home/khheo/.linuxbrew/lib"
  export CLASSPATH='.:/usr/lib/jvm/java-6-sun/lib/:/home/khheo/javalib/jdom/build/jdom.jar'
  export OCAMLRUNPARAM='b' #'b, s=2G, l=1G, i=50M, o=80'
  export PATH="$HOME/.local/bin:$HOME/go/bin:/snap/bin:$HOME/usr/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/bin:/usr/local/bin:/usr/lib/jvm/java-8-oracle/bin/:$HOME/.linuxbrew/bin:$PATH"
  export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
  export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
  export PYTHONPATH="$HOME/.local/lib/python3.8/site-packages"
else
  export LSCOLORS='ExFxCxDxBxegedabagaced'
  export PATH="$HOME/.cargo/bin:$HOME/.rbenv/shims:$HOME/usr/bin/:/usr/local/opt/llvm/bin:/opt/homebrew/bin:$PATH"
  eval "$(rbenv init -)"
fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:/opt/homebrew/bin:$PATH"
eval "$(pyenv init -)"

alias vi='nvim'
alias sr='screen -D -r main'
alias ta='tmux attach -t main'
alias python='python3'
alias eoe='eval $(opam env)'

eval `opam config env`

# . "$HOME/.cargo/env"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# docker alias
alias dr='docker run -it -d '
alias drp='docker run -it -d --privileged'
alias dl='docker ps'
alias dll='docker ps -a'
alias dil='docker image ls'
de () {
docker exec -it $1 /bin/bash
}
dq () {
docker stop $1;
docker rm $1
}

alias python='python3'

# opam alias
alias os='opam switch'
alias ee='eval $(opam env)'

# tmux alias
alias t='tmux'
alias ta='tmux attach-session -t '
alias tk='tmux kill-session -t '
alias tl='tmux ls'
alias taa='tmux attach'
alias e='exit'
alias tn='tmux rename-session -t '

# experiment alias
alias rep='$(pwd)/reserve.sh '
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias resp='$HOME/reserve.sh'
alias resp='reserve.sh'
alias resp='/home/changgong/environment/reserve.sh'
alias resp='/home/changgong/environment/reserve.sh'
alias resp='/home/changgong/environment/reserve.sh'
