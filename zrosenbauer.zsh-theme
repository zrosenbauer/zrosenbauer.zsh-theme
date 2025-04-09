git_relative_path() {
  local git_root=$(git rev-parse --show-toplevel 2>/dev/null)
  if [[ -n "$git_root" ]]; then
    local current_dir="$PWD"
    local relative_path="${current_dir#$git_root/}"
    if [[ "$relative_path" == "$current_dir" ]]; then
      echo " %{$fg[cyan]%}$(basename "$git_root")%{$reset_color%}"
    else
      echo " %{$fg[cyan]%}$(basename "$git_root")/$relative_path%{$reset_color%}"
    fi
  else
    echo " %{$fg[cyan]%}${PWD/#$HOME/~}%{$reset_color%}"
  fi
}

PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$reset_color%}\$(git_relative_path) \$(git_prompt_info) "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
