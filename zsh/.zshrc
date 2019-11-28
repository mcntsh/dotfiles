export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh


  # Set Spaceship ZSH as a prompt
  autoload -U promptinit; promptinit
  prompt spaceship
