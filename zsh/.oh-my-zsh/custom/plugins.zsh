plugins=(
  fzf
  git
  brew
  npm
  zsh-syntax-highlighting
)

_fzf_complete_git() {
  ARGS="$@"
  local branches
  branches=$(git branch -vv --all)
  files=$(git ls-files -m -o --exclude-standard)
  if [[ $ARGS == 'git checkout'* || $ARGS == 'git push origin'* ]]; then
    _fzf_complete "--reverse --multi" "$@" < <(
      echo $branches
    )
  elif [[ $ARGS == 'git add'* ]]; then 
    _fzf_complete "--reverse --multi" "$@" < <(
      echo $files
    )
  else
    eval "zle ${fzf_default_completion:-expand-or-complete}"
  fi
}

_fzf_complete_git_post() {
  awk '{print $1}'
}

source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
