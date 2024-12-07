# Setup fzf
# ---------
if [[ ! "$PATH" == */home/rikato/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/rikato/.fzf/bin"
fi

source <(fzf --zsh)
