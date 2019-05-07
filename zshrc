# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# Needed for some tools like SDKMAN
setopt clobber

alias gst="git status"

# Pretty print AWS policies
function policy_pprint {
    read test <&0;
    local filtered="sed -e 's/\\//g' -e 's/^.//' -e 's/.$//' <<< $test"
    echo $filtered
    eval "${filtered}"
}

export TERM="screen-256color"
export EDITOR="vim"
export VISUAL="vim"

export GOPATH=$HOME/Dev/Go
export PATH=$PATH:$HOME/.local/bin:$HOME/bin:/usr/local/go/bin:$GOPATH/bin

function print_colors() {
  for i in {0..15} ; do
    printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
    if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
        printf "\n";
    fi
  done
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/adriffaud/.sdkman"
[[ -s "/home/adriffaud/.sdkman/bin/sdkman-init.sh" ]] && source "/home/adriffaud/.sdkman/bin/sdkman-init.sh"

# fnm
export PATH=$HOME/.fnm:$PATH
eval "`fnm env --multi`"
