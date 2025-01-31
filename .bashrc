echo "Welcome, SerAbin1!
1. Understand the problem; Break it down; Solve the sub-problems.
2. Are you perfect? Did you make any progress?"

shopt -s expand_aliases

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

zl() {
        z "$1" && ls
}

serve(){
    python3 -m http.server "$1"
}

servenet(){
    python3 -m http.server "$1" &
        SERVER_PID=$!  # Save the background process ID

        ssh -R 80:localhost:"$1" serveo.net

        kill $SERVER_PID  # Kill the server process when done
}

# git_branch() {
#    git branch --show-current 2>/dev/null
# }

git_branch2() {
    branch=$(git branch 2>/dev/null | grep '\*' | sed 's/* /{/' | sed 's/$/}/')
    echo "$branch"
}

git_merge() {
    git merge "$1" --strategy-option theirs
}

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

source /data/data/com.termux/files/usr/share/bash-completion/bash_completion

export TERM=xterm-256color

# export PS1='\e[32m\w\e[m$(git rev-parse --is-inside-work-tree &>/dev/null && echo "\e[31m{$(git branch --show-current)}\e[m") \$ '

export PS1='\w$(git_branch2) \$ '

alias server="python -m http.server &"

alias killserver="pkill -f 'python -m http.server'"

alias cdl="zl"

alias cd="z"

alias ls="lsd"

# Initialize zoxide
eval "$(zoxide init bash)"
export PYTHONPATH=$PYTHONPATH:/data/data/com.termux/files/usr/lib/python3.12/site-packages

