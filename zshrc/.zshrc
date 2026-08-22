if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
	git
	zsh-autosuggestions

)

source $ZSH/oh-my-zsh.sh

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}

 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='vim'
 fi
# diacritics support
setopt COMBINING_CHARS
SCRIPTSDIR=/home/human/lab/scripts
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /home/human/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="$PATH:$HOME/.cargo/env"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:/home/human/.local/bin"
export PATH="$PATH:$SCRIPTSDIR"
source ~/dotfiles/aliases.zsh
source ~/.zshsecrets.sh


# opencode
export PATH=/home/human/.opencode/bin:$PATH
