#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

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

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

alias dc="docker-compose"
alias dcu="docker-compose up"

alias gst="git status"
alias gco="git checkout"

alias pgloader="docker run --rm -it --security-opt seccomp=unconfined --name pgloader -v $(pwd):/opt/src/pgloader dimitri/pgloader pgloader"

export TERM="screen-256color"
export EDITOR="vim"
export VISUAL="vim"

export AWS_PROFILE="iotsolutions"

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

# Bastion IPs
DEV1_BASTION=54.77.164.59
QA_BASTION=54.72.142.184
PERF_BASTION=52.30.133.66
TOOLBOX_BASTION=54.154.65.165
EU_BASTION=52.210.120.152
NA_BASTION=52.38.87.145
TOOLBOX_PROD_BASTION=54.76.215.52
# Admin IPs
DEV1_ADMIN=10.188.71.235
QA_ADMIN=10.187.70.26
PERF_ADMIN=10.186.71.68
TOOLBOX_ADMIN=10.189.69.244
EU_ADMIN=10.192.68.146
NA_ADMIN=10.190.64.170
TOOLBOX_PROD_ADMIN=10.194.64.10

alias aws_get_profil='aws configure list'
alias aws_set_profil_default='export AWS_DEFAULT_PROFILE=default'
alias aws_set_profil_na='export AWS_DEFAULT_PROFILE=na'
alias aws_set_profil_eu='export AWS_DEFAULT_PROFILE=eu'

alias aws_list_preprod_cfg='__aws_list s3://av-preprod-secrets/files/config/'
alias aws_list_prod_cfg='__aws_list s3://av-prod-secrets/files/config/'
alias aws_view_preprod_cfg='__aws_view s3://av-preprod-secrets/files/config/'
alias aws_view_prod_cfg='__aws_view s3://av-prod-secrets/files/config/'

alias aws_ips_dev1_loghost='__aws_private_ips dev1-av-loghost'
alias aws_ips_qa_loghost='__aws_private_ips qa-av-loghost'
alias aws_ips_perf_loghost='__aws_private_ips perf-av-loghost'
alias aws_ips_eu_loghost='__aws_private_ips eu-av-loghost'
alias aws_ips_na_loghost='__aws_private_ips na-av-loghost'

alias aws_ips_dev1_core='__aws_private_ips dev1-av-core-asg'
alias aws_ips_qa_core='__aws_private_ips qa-av-core-asg'
alias aws_ips_perf_core='__aws_private_ips perf-av-core-asg'
alias aws_ips_eu_core='__aws_private_ips eu-av-core-asg'
alias aws_ips_na_core='__aws_private_ips na-av-core-asg'

alias aws_ips_dev1_device='__aws_private_ips dev1-av-device-asg'
alias aws_ips_qa_device='__aws_private_ips qa-av-device-asg'
alias aws_ips_perf_device='__aws_private_ips perf-av-device-asg'
alias aws_ips_eu_device='__aws_private_ips eu-av-device-asg'
alias aws_ips_na_device='__aws_private_ips na-av-device-asg'

alias go_dev1_bastion='ssh -A core@$DEV1_BASTION'
alias go_qa_bastion='ssh -A core@$QA_BASTION'
alias go_perf_bastion='ssh -A core@$PERF_BASTION'
alias go_toolbox_bastion='ssh -A core@$TOOLBOX_BASTION'
alias go_eu_bastion='ssh -A core@$EU_BASTION'
alias go_na_bastion='ssh -A core@$NA_BASTION'
alias go_toolbox_prod_bastion='ssh -A core@$TOOLBOX_PROD_BASTION'

alias go_dev1_loghost='go_dev1_bastion -t ssh core@10.188.69.159'
alias go_qa_loghost='go_qa_bastion -t ssh core@10.187.65.149'
alias go_eu_loghost='go_eu_bastion -t ssh core@10.192.69.37'
alias go_na_loghost='go_na_bastion -t ssh core@10.190.66.116'

alias go_eu_nat='go_eu_bastion -t "ssh ec2-user@10.192.6.185"'

alias go_jenkins_prod='go_toolbox_prod_bastion -t "ssh ubuntu@10.194.71.41 -t sudo -u jenkins -i"'
alias go_jenkins='go_toolbox_bastion -t "ssh ubuntu@10.189.70.215 -t sudo -u jenkins -i"'
alias go_zlatan='go_toolbox_bastion -t "ssh ubuntu@10.189.71.138 -t sudo -u jenkins -i"'
alias go_cantona='go_toolbox_bastion -t "ssh ubuntu@10.189.68.11 -t sudo -u jenkins -i"'
alias go_ginola='go_toolbox_bastion -t "ssh ubuntu@10.189.69.209 -t sudo -u jenkins -i"'

alias go_airbot='go_toolbox_bastion -t "ssh ubuntu@10.189.66.188"'

alias go_emr_toolbox='go_toolbox_bastion -t "ssh hadoop@ip-10-189-64-8.eu-west-1.compute.internal"'

# av-core-oracle
#alias tunnel_core_dev1='__aws_connect av-core.dev1-airvantage.net 80 $DEV1_BASTION $DEV1_ADMIN 8079 8080'

alias tunnel_db_core_dev1='__aws_connect av-core-oracle.dev1-airvantage.net 1521 $DEV1_BASTION $DEV1_ADMIN 8999 9000'
alias tunnel_db_core_qa='__aws_connect av-core-oracle.qa-airvantage.net 1521 $QA_BASTION $QA_ADMIN 9001 9002'
alias tunnel_db_core_perf='__aws_connect av-core-oracle.perf-airvantage.net 1521 5$PERF_BASTION $PERF_ADMIN 9003 9004'
alias tunnel_db_core_na='__aws_connect av-core-oracle.na-airvantage.net 1521 $NA_BASTION $NA_ADMIN 9005 9006'
alias tunnel_db_core_eu='__aws_connect av-core-oracle.eu-airvantage.net 1521 $EU_BASTION $EU_ADMIN 9007 9008'

# av-sched
alias tunnel_sched_dev1='__aws_connect av-sched.dev1-airvantage.net 80 $DEV1_BASTION $DEV1_ADMIN 9029 9030'
alias tunnel_sched_qa='__aws_connect av-sched.qa-airvantage.net 80 $QA_BASTION $QA_ADMIN 9031 9032'
alias tunnel_sched_perf='__aws_connect av-sched.perf-airvantage.net 80 5$PERF_BASTION $PERF_ADMIN 9033 9034'
alias tunnel_sched_na='__aws_connect av-sched.na-airvantage.net 80 $NA_BASTION $NA_ADMIN 9035 9036'
alias tunnel_sched_eu='__aws_connect av-sched.eu-airvantage.net 80 $EU_BASTION $EU_ADMIN 9037 9038'

# av-sched-db
alias tunnel_db_sched_dev1='__aws_connect av-sched-db.dev1-airvantage.net 3306 $DEV1_BASTION $DEV1_ADMIN 9039 9040'
alias tunnel_db_sched_qa='__aws_connect av-sched-db.qa-airvantage.net 3306 $QA_BASTION $QA_ADMIN 9041 9042'
alias tunnel_db_sched_perf='__aws_connect av-sched-db.perf-airvantage.net 3306 5$PERF_BASTION $PERF_ADMIN 9043 9044'
alias tunnel_db_sched_na='__aws_connect av-sched-db.na-airvantage.net 3306 $NA_BASTION $NA_ADMIN 9045 9046'
alias tunnel_db_sched_eu='__aws_connect av-sched-db.eu-airvantage.net 3306 $EU_BASTION $EU_ADMIN 9047 9048'

# av-accounts-db
alias tunnel_db_accounts_dev1='__aws_connect av-accounts-db.dev1-airvantage.net 3306 $DEV1_BASTION $DEV1_ADMIN 9049 9050'
alias tunnel_db_accounts_qa='__aws_connect av-accounts-db.qa-airvantage.net 3306 $QA_BASTION $QA_ADMIN 9051 9052'
alias tunnel_db_accounts_na='__aws_connect av-accounts-db.na-airvantage.net 3306 $NA_BASTION $NA_ADMIN 9053 9054'
alias tunnel_db_accounts_eu='__aws_connect av-accounts-db.eu-airvantage.net 3306 $EU_BASTION $EU_ADMIN 9055 9056'

# av-authserver-db
alias tunnel_db_authserver_dev1='__aws_connect auth-server-db.dev1-airvantage.net 3306 $DEV1_BASTION $DEV1_ADMIN 9059 9060'
alias tunnel_db_authserver_qa='__aws_connect auth-server-db.qa-airvantage.net 3306 $QA_BASTION $QA_ADMIN 9061 9062'
alias tunnel_db_authserver_eu='__aws_connect auth-server-db.eu-airvantage.net 3306 $EU_BASTION $EU_ADMIN 9063 9064'

# av-authserver
alias tunnel_authserver_qa='__aws_connect auth-server.qa-airvantage.net 80 $QA_BASTION $QA_ADMIN 9071 9072'
alias tunnel_authserver_eu='__aws_connect auth-server.eu-airvantage.net 80 $EU_BASTION $EU_ADMIN 9073 9074'

alias tunnel_aurora_dev1='__aws_connect av-data-aurora.dev1-airvantage.net 3306 $DEV1_BASTION $DEV1_ADMIN 9078 9079'

# toolbox aurora
alias tunnel_aurora_toolbox='__aws_connect av-data-aurora.toolbox-airvantage.net 3306 $TOOLBOX_BASTION $TOOLBOX_ADMIN 9075 9076'
alias tunnel_redshift_toolbox='__aws_connect toolbox-av-data-stores.ctmoprzhxv1w.eu-west-1.redshift.amazonaws.com 5439 $TOOLBOX_BASTION $TOOLBOX_ADMIN 9077 9078'

alias tunnel_emr_toolbox='ssh -i ~/.ssh/dev.pem -ND 8157 -f hadoop@10.189.65.201'

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

# Usage: __aws_connect <service_host> <service_port> <bastion_ip> <admin_ip> <local_port1> <local_port2>
function __aws_connect {
  local service_host="$1"
  local service_port="$2"
  local bastion_ip="$3"
  local admin_ip="$4"
  local local_port1="$5"
  local local_port2="$6"

  tunnel1="ssh -A -L ${local_port1}:${admin_ip}:22 -N -f core@${bastion_ip}"
  tunnel2="ssh -A -L ${local_port2}:${service_host}:${service_port} -N -p ${local_port1} -f core@localhost"
  echo ${tunnel1}
  eval "${tunnel1}"
  sleep 1
  echo ${tunnel2}
  eval "${tunnel2}"

  echo
  echo -------------------------------------------------------------------------------
  echo \>\> the service \(${service_host}\) is accessible to: http://localhost:${local_port2}
  echo -------------------------------------------------------------------------------
}

# Usage: __aws_private_ips qa-av-core-asg
#function __aws_private_ips {
#  aws ec2 describe-instances | jq -r '.Reservations[].Instances[0] | select(.State.Name == "running" and .Tags[].Key == "Name" and .Tags[].Value == $name) | .PrivateIpAddress' --arg name $1
#}

#function postman-update {
#  cd ~/bin
#  echo 'Removing old Postman version'
#  rm -rf Postman
#  echo 'Downloading latest Postman version'
#  curl https://dl.pstmn.io/download/latest/linux64 -o postman.tar.gz
#  echo 'Extracting latest Postman version'
#  tar -xzf postman.tar.gz
#  rm -f postman.tar.gz
#  cd -
#}



#################
# IOT SOLUTIONS #
#################

IOT_STAGE_BASTION=34.240.194.144
IOT_IOC_BASTION=54.154.161.116

alias go_iot_stage_bastion='ssh -A ec2-user@$IOT_STAGE_BASTION'
alias go_iot_stage_consul='ssh -A -J ec2-user@$IOT_STAGE_BASTION ec2-user@consul-a.stage.bk'

alias tunnel_iot_stage_nomad='__iot_connect consul-a.stage.bk 4646 $IOT_STAGE_BASTION 4646'
alias tunnel_iot_stage_consul='__iot_connect consul-a.stage.bk 8500 $IOT_STAGE_BASTION 8500'
alias tunnel_iot_stage_traefik='__iot_connect traefik-a1.stage.bk 8080 $IOT_STAGE_BASTION 4647'

alias go_iot_ioc_bastion='ssh -A ec2-user@$IOT_IOC_BASTION'
alias go_iot_ioc_consul='ssh -A -J ec2-user@$IOT_IOC_BASTION ec2-user@consul-a.ioc.bk'

# Usage: __iot_connect <service_host> <service_port> <bastion_ip> <local_port>
function __iot_connect {
 local service_host="$1"
 local service_port="$2"
 local bastion_ip="$3"
 local local_port="$4"

 tunnel="ssh -A -L ${local_port}:${service_host}:${service_port} ec2-user@${bastion_ip} -N -f"

 echo ${tunnel}
 eval "${tunnel}"

 echo
 echo -------------------------------------------------------------------------------
 echo \>\> the service \(${service_host}\) is accessible to: http://localhost:${local_port}
 echo -------------------------------------------------------------------------------
}


function prompt_get_aws_env() {
  if [[ ( -n ${AWS_DEFAULT_PROFILE}) && ("${AWS_DEFAULT_PROFILE}" != "default") ]]
  then
      echo "%B%F{red}[AWS >> ${AWS_DEFAULT_PROFILE}]%f%b "
  fi
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/adriffaud/.sdkman"
[[ -s "/home/adriffaud/.sdkman/bin/sdkman-init.sh" ]] && source "/home/adriffaud/.sdkman/bin/sdkman-init.sh"

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /home/adriffaud/.nvm/versions/node/v8.9.4/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /home/adriffaud/.nvm/versions/node/v8.9.4/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh
