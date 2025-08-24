# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/plugin.zsh
eval "$(starship init zsh)"
