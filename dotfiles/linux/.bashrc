# Customize command prompt
build_ps1_func() {
    PS1="┌[\e[1;32m\]\u\[\e[0m\]@\e[1;32m\]\h\e[0m:\e[1;34m\]\w\e[0m\] \e[1;33m\]bash\e[0m\]"
    if [ "$(git rev-parse --git-dir 2> /dev/null)" == ".git" ]; then
        PS1+=" \e[1;35m\]$(git rev-parse --abbrev-ref HEAD)\e[0m\]"
    fi
    PS1+="]\n└─> "
}
PROMPT_COMMAND='build_ps1_func'

# Aliases and functions
alias gh='history | grep'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
md() {
    mkdir -p "$1"
    cd "$1"
}

