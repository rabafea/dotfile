# FPATH
fpath=(
  $ZDOTDIR/functions
  $ZDOTDIR/completion
  $fpath
)

# ENV
if [ -d $GCPPATH ]; then
  source $GCPPATH/path.zsh.inc
  source $GCPPATH/completion.zsh.inc
fi

# Auto compile
if [ ! -f $XDG_CONFIG_HOME/zsh/.zshrc.zwc -o $XDG_CONFIG_HOME/zsh/.zshrc -nt $XDG_CONFIG_HOME/zsh/.zshrc.zwc ]; then
   zcompile $XDG_CONFIG_HOME/zsh/.zshrc
fi

# Plugins
source $ZPLUG_HOME/init.zsh
zplug load

# Options
setopt auto_menu
bindkey -v
setopt no_beep
setopt print_eight_bit

# History options
HISTFILE=$XDG_CACHE_HOME/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000
setopt correct
setopt share_history
setopt extended_history
setopt inc_append_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_reduce_blanks
setopt hist_no_store
setopt hist_expire_dups_first

# Auto load
autoload -Uz do_enter
autoload -Uz history_selection
autoload -Uz path_selection
autoload -Uz docker_images_selection
autoload -Uz docker_container_selection
autoload -Uz git_cd
autoload -Uz pero
autoload -Uz operation_tmux
zle -N do_enter
zle -N history_selection
zle -N path_selection
zle -N docker_images_selection
zle -N docker_container_selection
zle -N git_cd
zle -N pero
zle -N operation_tmux

# Key binding
bindkey '^m' do_enter
bindkey '^f' path_selection
bindkey '^h' anyframe-widget-execute-history
bindkey '^k' anyframe-widget-kill
bindkey '^g' operation_tmux

# Alias
alias sudo='sudo '
alias ll='ls -alG'
alias untar='tar xzvf'
alias setlangja='export LANG=ja_JP.UTF-8'
alias setlangc='export LANG=C'
alias vim='nvim'
alias vi='nvim'
alias repo=anyframe-widget-cd-ghq-repository
alias tmux='tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf'
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
alias image_remove=docker_images_selection
alias container_stop=docker_container_selection
alias up='cd ../'
alias down'cd -d */ | anyframe-selector-auto | anyframe-action-execute cd'
alias cd=git_cd

# OS settings load
case $OSTYPE in
  darwin*)
    [ -f $ZSH_CONF_DIR/osx.zsh ] && source $ZSH_CONF_DIR/osx.zsh
    ;;
  linux*)
    [ -f $ZSH_CONF_DIR/linux.zsh ] && source $ZSH_CONF_DIR/linux.zsh
    ;;
esac

# Local settings load
[ -f $ZSH_CONF_DIR/.zshrc.local ] && source $ZSH_CONF_DIR/.zshrc.local
