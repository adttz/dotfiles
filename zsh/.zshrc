# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi




# Auto-start or attach tmux only if not already inside one
if command -v tmux >/dev/null 2>&1; then
  # Skip if already in tmux or running inside VS Code terminal
  if [ -z "$TMUX" ] && [ "$TERM_PROGRAM" != "vscode" ]; then
    if tmux has-session 2>/dev/null; then
      tmux attach
    else
      tmux new -s main
    fi
  fi
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias v='nvim'
alias vim='nvim'
alias ls='lsd'

# List files automatically after cd
chpwd() {
  lsd -la --group-dirs first
}

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


export PATH=$PATH:/Users/armaan/.spicetify
