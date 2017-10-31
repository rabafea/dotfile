## Alias
alias vi 'nvim'
alias vim 'nvim'
alias sudo 'sudo '
alias ls 'exa'
alias ll 'exa -alhG'
alias untar 'tar -xzvf'
alias tmux 'tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf'
alias cp 'cp -i'
alias mv 'mv -i'
alias rm 'rm -i'
alias repo '__select_repository'
alias reload 'source $XDG_CONFIG_HOME/fish/config.fish'
alias reload-tmux 'tmux source $XDG_CONFIG_HOME/tmux/tmux.conf'
alias kill '__process_kill'
alias force-kill '__force_process_kill'
alias search-source '__search_source_code'
alias tree 'exa --tree'

# Keybind
function fish_user_key_bindings
  bind \cr __select_history
  bind \ck up-or-search
  bind \cj down-or-search
  bind \ch backward-char
  bind \cl forward-char
end

function done_enter --on-event fish_postexec
  __do_enter_action $argv
end

[ (uname) = 'Darwin' ]; and source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
[ -n (type gcloud) ]; and complete --command gcloud --arguments="($XDG_CONFIG_HOME/fish/gcloud_completion.py (commandline -cp))"
eval (direnv hook fish)
