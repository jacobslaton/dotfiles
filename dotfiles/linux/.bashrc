# Customize command prompt
PS1="┌[\e[1;32m\]\u\[\e[0m\]@\e[1;32m\]\h\e[0m \e[1;34m\]\w\e[0m\]]\n└─> "

# Aliases and functions
alias gh='history | grep'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
md() {
    mkdir -p "$1"
    cd "$1"
}

