fpath=(
  $ZDOTDIR/functions
  $ZDOTDIR/completion
  $fpath
)

if [ ! -f $XDG_CONFIG_HOME/zsh/.zshrc.zwc -o $XDG_CONFIG_HOME/zsh/.zshrc -nt $XDG_CONFIG_HOME/zsh/.zshrc.zwc ]; then
   zcompile $XDG_CONFIG_HOME/zsh/.zshrc
fi

source $ZPLUG_HOME/init.zsh
eval "$(anyenv init -)"
eval "$(direnv hook zsh)"

##### plugins ######
zplug "zsh-users/zsh-syntax-highlighting"
zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-completions"
zplug "mrowa44/emojify", as:command
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure", use:pure.zsh, as:theme
zplug "zsh-users/zsh-autosuggestions"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load --verbose

##### enhancd #####
export ENHANCD_FILTER=peco
export ENHANCD_DIR=$XDG_CACHE_HOME/zsh

##### alias #####
alias sudo='sudo '
alias ll='ls -alG'
alias untar='tar xzvf'
alias setlangja='export LANG=ja_JP.UTF-8'
alias setlangc='export LANG=C'
alias vim='nvim'
alias vi='nvim'

##### options #####
setopt no_beep
setopt print_eight_bit
HISTFILE=$XDG_CACHE_HOME/zsh/history
HISTSIZE=1000
SAVEHIST=1000
setopt auto_menu
bindkey -v

autoload -Uz do_enter
autoload -Uz history_selection
autoload -Uz path_selection
zle -N do_enter
zle -N history_selection
zle -N path_selection
bindkey '^m' do_enter
bindkey '^h' history_selection
bindkey '^f' path_selection

##### zsh local config #####
[ -f $ZSH_CONF_DIR/.zshrc.local ] && source $ZSH_CONF_DIR/.zshrc.local

if [[ ! -n $TMUX && $- == *l* ]]; then
  # get the IDs
  ID="`tmux list-sessions`"
  if [[ -z "$ID" ]]; then
    tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf new-session
  fi
  create_new_session="Create New Session"
  ID="$ID\n${create_new_session}:"
  ID="`echo $ID | peco | cut -d: -f1`"
  if [[ "$ID" = "${create_new_session}" ]]; then
    tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf new-session
  elif [[ -n "$ID" ]]; then
    tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf attach-session -t "$ID"
  else
    :  # Start terminal normally
  fi
fi
