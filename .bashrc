echo "Welcome, SerAbin1"

f() {
    local file
    file=$(fzf --height=40% --preview 'cat {} 2>/dev/null' --preview-window=right:60%)
    [ -n "$file" ] && nvim "$file"
}

fd() {
    local dir
    dir=$(find . -type d 2>/dev/null | fzf --height=40%)
    [ -n "$dir" ] && cd "$dir" && ls
}

c() {
    clang++ -g "$1" -o "${1%.cpp}" && ./"${1%.cpp}"
}

cdl() {
    cd "$1" && ls
}

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

source /data/data/com.termux/files/usr/share/bash-completion/bash_completion

export TERM=xterm-256color

shopt -s cdspell

alias server="python -m http.server &"

alias killserver="pkill -f 'python -m http.server'"

export PATH="$PATH:$HOME/.local/share/nvim/mason/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Initialize zoxide
eval "$(zoxide init bash)"

zl() {
    if [ -z "$1" ]; then
        cd && ls
    else
        z "$1" && ls
    fi
}

alias cd="zl"
