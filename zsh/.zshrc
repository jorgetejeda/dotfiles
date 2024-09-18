
ZSH="$HOME/.oh-my-zsh"
export PATH="/usr/local/Cellar/openvpn/2.5.3/sbin:$PATH"

# ------ HOMEBREW --------- 

export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# ----- ZSH PLUGINS AND THEMES -----

# ZSH_THEME="jtejeda"
ZSH_DISABLE_COMPFIX="true"

plugins=(
  git zsh-autosuggestions
  git zsh-syntax-highlighting
  web-search  
)

source $ZSH/oh-my-zsh.sh
[[ -f ~/dotfiles/zsh/alias.zsh ]] && source ~/dotfiles/zsh/alias.zsh

# ----- STARSHIP --------

eval "$(starship init zsh)"

# ----- ANDROID --------

# Intentar configurar JAVA_HOME
JAVA_HOME=$(/usr/libexec/java_home -v 17)
if [ -d "$JAVA_HOME" ]; then
    echo "JAVA_HOME está configurado en: $JAVA_HOME"
    export JAVA_HOME
else
    echo "ADVERTENCIA: JAVA_HOME no se pudo configurar. Verifica la instalación de Java."
fi

# Definir la ruta de ANDROID_HOME
ANDROID_HOME=$HOME/Library/Android/sdk
if [ -d "$ANDROID_HOME" ]; then
    echo "ANDROID_HOME está configurado en: $ANDROID_HOME"
    
    export ANDROID_HOME
    export PATH=$PATH:$ANDROID_HOME/emulator
    export PATH=$PATH:$ANDROID_HOME/tools
    export PATH=$PATH:$ANDROID_HOME/tools/bin
    export PATH=$PATH:$ANDROID_HOME/platform-tools
else
    echo "ADVERTENCIA: ANDROID_HOME no está configurado correctamente. Verifica la ruta $ANDROID_HOME."
fi

# ----- NODE VERSION MANAEGR ------
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh


# killpid <pid>
kill_pid(){
  "kill -9 $(lsof -i:${1})"
}

# ----- SSH ------
# FIXME: This function overrides the ssh command to change directory when no arguments are provided
# ssh() {
#     if [ "$#" -eq 0 ]; then
#         cd ~/.ssh/
#     else
#         command ssh "$@"
#     fi
# }

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="$HOME/.sdkman"
#[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh#"
