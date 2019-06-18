export DOTFILES="$HOME/.dotfiles"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=nvim
export VISUAL=nvim

export GPG_TTY=`tty`
export LESS="-XRF" # Beautiful less
export GREP_OPTIONS=--color=always

# BREW
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# PLUGINS
source $DOTFILES/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $DOTFILES/zsh/.zsh_prompt

source $DOTFILES/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=black,fg=yellow,bold'

# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# RVM
#export PATH="$PATH:$HOME/.rvm/bin"
# source ~/.rvm/scripts/rvm

# ELIXIR
# . $(brew --prefix asdf)/asdf.sh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm() {
	unset -f nvm
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
	nvm "$@"
}

# YARN
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# #ALIASES
source $DOTFILES/zsh/.zsh_aliases
source $DOTFILES/zsh/.zsh_abbreviations

# LOCAL
test -e "${HOME}/.zshrc.local" && source "${HOME}/.zshrc.local"

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

bindkey -v
# NAVIGATION
setopt AUTO_CD              # Go to folder path without using cd.

setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

setopt CORRECT              # Spelling correction
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.

# HISTORY
export HISTSIZE=10000 # Maximum events for internal history
export SAVEHIST=10000 # Maximum events in history file

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
setopt ALWAYS_TO_END       # Move cursor to the end of a completed word.
setopt PATH_DIRS           # Perform path search even on command names with slashes.
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH    # If completed parameter is a directory, add a trailing slash.
setopt EXTENDED_GLOB       # Needed for file modification glob modifiers with compinit
setopt MENU_COMPLETE     # Do not autoselect the first completion entry.

# # Case-insensitive completion
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# unsetopt CASE_GLOB

# # Group matches and describe.
# zstyle ':completion:*:*:*:*:*' menu select
# zstyle ':completion:*:matches' group 'yes'
# zstyle ':completion:*:options' description 'yes'
# zstyle ':completion:*:options' auto-description '%d'
# zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
# zstyle ':completion:*:descriptions' format ' %F{green}-- %d --%f'
# zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
# zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
# zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' verbose yes
# 
# # Fuzzy match mistyped completions.
# zstyle ':completion:*' completer _complete _match _approximate
# zstyle ':completion:*:match:*' original only
# zstyle ':completion:*:approximate:*' max-errors 1 numeric
# 
# # Increase the number of errors based on the length of the typed word. But make
# # sure to cap (at 7) the max-errors to avoid hanging.
# zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'
# 
# # Don't complete unavailable commands.
# zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
# 
# # Array completion element sorting.
# zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
# 
# # Directories
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
# zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
# zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
# zstyle ':completion:*' squeeze-slashes true
# 
# # Environment Variables
# zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}
# 
# # Populate hostname completion. But allow ignoring custom entries from static
# # */etc/hosts* which might be uninteresting.
# 
# zstyle -e ':completion:*:hosts' hosts 'reply=(
#   ${=${=${=${${(f)"$(cat {/etc/ssh/ssh_,~/.ssh/}known_hosts(|2)(N) 2> /dev/null)"}%%[#| ]*}//\]:[0-9]*/ }//,/ }//\[/ }
#   ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2> /dev/null))"}%%(\#${_etc_host_ignores:+|${(j:|:)~_etc_host_ignores}})*}
#   ${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2> /dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
# )'
# 
# # zstyle '*' single-ignored show
# 
# # Ignore multiple entries.
# zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
# zstyle ':completion:*:rm:*' file-patterns '*:all-files'

autoload compinit && compinit
