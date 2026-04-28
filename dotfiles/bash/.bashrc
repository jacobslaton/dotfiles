# Customize command prompt
build_ps1_func() {
	PS1="┌[\e[32m\]\u\[\e[0m\]@\e[32m\]\h\e[0m:\e[34m\]\w\e[0m\] \e[35m\]bash\e[0m\]"
	if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
		BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
		if [ -n "$BRANCH" ]; then
			PS1+=" \e[33m\]${BRANCH}\e[0m\]"
		fi
	fi
	if [ -n "$VIRTUAL_ENV" ]; then
		regex="s/$(echo ~ | sed 's/\//\\\//g')/~/"
		PS1+=" \e[36m\]$(echo "$VIRTUAL_ENV" | sed "$regex")\e[0m\]"
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

# nvm
source /usr/share/nvm/init-nvm.sh
