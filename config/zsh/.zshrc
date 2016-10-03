ZSH_CONF_DIR=$XDG_CONFIG_HOME/zsh

function loadlib() {
        lib=${1:?"You have to specify a library file"}
        if [ -f "$lib" ];then #ファイルの存在を確認
                source "$lib"
        fi
}

loadlib $ZSH_CONF_DIR/00_plugins.zsh
loadlib $ZSH_CONF_DIR/01_alias.zsh
loadlib $ZSH_CONF_DIR/02_options.zsh
loadlib $ZSH_CONF_DIR/03_prompt.zsh
loadlib $ZSH_CONF_DIR/04_functions.zsh
loadlib $ZSH_CONF_DIR/05_autocomplete.zsh
loadlib $ZSH_CONF_DIR/06_environment.zsh
loadlib $ZSH_CONF_DIR/07_tmux.zsh
loadlib $ZSH_CONF_DIR/08_peco.zsh