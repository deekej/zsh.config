# If not running interactively, then quit:
[ -z "$PS1" ] && return

# TTY does not support NERD fonts ->> run Bash instead:
if tty | grep '/dev/tty' &> /dev/null; then
  exec bash -i
  return
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# All ZSH-related stuff is moved to ~/.zsh folder:
export ZDOTDIR="$HOME/.zsh"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$ZDOTDIR/oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
export ZSH_THEME='powerlevel10k/powerlevel10k'

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
export UPDATE_ZSH_DAYS=30

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$ZDOTDIR"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  autojump
  colored-man-pages
  command-not-found
  docker
#  docker-compose
  git
# git-auto-fetch
# pass
# pep8
# pip
# pylint
  sudo
  thefuck
# vault
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.zsh/p10k.zsh.
# NOTE: The p10k theme is automatically sourced by oh-my-zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# -----------------------------------------------------------------------------

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# -----------------------------------------------------------------------------
#    Dee'Kej's custom configuration
# -----------------------------------------------------------------------------
# NOTE: Custom aliases are sourced automaticaly by oh-my-zsh from ~/.zsh folder.

# Use emacs-style shortcuts
bindkey -e

# History settings:
HISTFILE=~/.zsh/history
HISTSIZE=10240
SAVEHIST=1024

setopt appendhistory
setopt incappendhistory
setopt histignorealldups
setopt histnostore
setopt histreduceblanks

# -------------------------------------

setopt autocd
setopt beep
setopt extendedglob
setopt nomatch
setopt notify

# -------------------------------------

# Custom rebinding to enable both 'sudo' and 'thefuck' plugins:
bindkey -M emacs '\e\e\e' sudo-command-line
bindkey -M vicmd '\e\e\e' sudo-command-line
bindkey -M viins '\e\e\e' sudo-command-line

bindkey -M emacs '\e\e' fuck-command-line
bindkey -M vicmd '\e\e' fuck-command-line
bindkey -M viins '\e\e' fuck-command-line

# -------------------------------------

zstyle ':completion:*:ssh:*' hosts off

# -------------------------------------

# Source the shared configuration, custom aliases, and defaults overrides:
if [ -f /etc/profile.d/global-environment.sh ]; then
  source /etc/profile.d/global-environment.sh
fi

# -------------------------------------

# Specific ZSH-only aliases:
alias cdj='j'
alias cdjc='jc'
alias cdjo='jo'
alias cdjco='jco'
