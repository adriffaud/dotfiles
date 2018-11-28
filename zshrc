# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# Needed for some tools like SDKMAN
setopt clobber

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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

export DRONE_SERVER="https://ci.flowthings.io"
export DRONE_TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZXh0IjoiYWRyaWZmYXVkIiwidHlwZSI6InVzZXIifQ.wzblQQq_WeGY5LCjGkPFLQp67hFoYNzpJBhwIwVhcnY"

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

alias aws_get_profil='aws configure list'
alias aws_set_profil_default='export AWS_DEFAULT_PROFILE=default'
alias aws_set_profil_na='export AWS_DEFAULT_PROFILE=na'
alias aws_set_profil_eu='export AWS_DEFAULT_PROFILE=eu'

alias aws_list_preprod_cfg='__aws_list s3://av-preprod-secrets/files/config/'
alias aws_list_prod_cfg='__aws_list s3://av-prod-secrets/files/config/'
alias aws_view_preprod_cfg='__aws_view s3://av-preprod-secrets/files/config/'
alias aws_view_prod_cfg='__aws_view s3://av-prod-secrets/files/config/'

# ---------
# Functions
# ---------

# Usage: __aws_list <s3_path>
function __aws_list {
  local s3_cmd="aws s3 ls $1"
  echo ${s3_cmd}
  eval "${s3_cmd}"
}

# Usage: __aws_view <s3_path> <s3_file>
function __aws_view {
  local s3_cmd="aws s3 cp $1$2 -"
  echo ${s3_cmd}
  eval "${s3_cmd}"
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/adriffaud/.sdkman"
[[ -s "/home/adriffaud/.sdkman/bin/sdkman-init.sh" ]] && source "/home/adriffaud/.sdkman/bin/sdkman-init.sh"

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /home/adriffaud/.nvm/versions/node/v8.9.4/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /home/adriffaud/.nvm/versions/node/v8.9.4/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh
