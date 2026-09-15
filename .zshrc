# Created by newuser for 5.9.2
export PATH="$HOME/.local/bin:$PATH"
eval "$(starship init zsh)"

# ------------------------------
# Completion
# ------------------------------
autoload -Uz compinit
compinit

# ------------------------------
# History
# ------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt AUTO_CD

# ------------------------------
# Autosuggestions
# ------------------------------
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# ------------------------------
# fzf
# ------------------------------
source <(fzf --zsh)

# ------------------------------
# zoxide
# ------------------------------
eval "$(zoxide init zsh)"

# ------------------------------
# Starship
# ------------------------------
eval "$(starship init zsh)"

# ------------------------------
# Syntax highlighting
# KEEP THIS NEAR THE END
# ------------------------------
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="$HOME/.local/npm/bin:$PATH"
