export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"

eval "$(rbenv init - zsh)"

source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

source $ZSH/oh-my-zsh.sh
