set EDITOR 'nvim'
abbr vim 'nvim'

abbr ls 'exa -l --group-directories-first'

abbr dkps 'docker ps'
abbr dkpsa 'docker ps -a'

abbr gst 'git status'

abbr mk 'minikube'
abbr k 'kubectl'

source ~/.asdf/asdf.fish

# WSL2 pageant
##############
set -x SSH_AUTH_SOCK "$HOME/.ssh/agent.sock"
if not ss -a | grep -q "$SSH_AUTH_SOCK";
  rm -f "$SSH_AUTH_SOCK"
  set wsl2_ssh_pageant_bin "$HOME/.ssh/wsl2-ssh-pageant.exe"
  if test -x "$wsl2_ssh_pageant_bin";
    setsid nohup socat UNIX-LISTEN:"$SSH_AUTH_SOCK,fork" EXEC:"$wsl2_ssh_pageant_bin" >/dev/null 2>&1 &
  else
    echo >&2 "WARNING: $wsl2_ssh_pageant_bin is not executable."
  end
  set --erase wsl2_ssh_pageant_bin
end

set -x GPG_AGENT_SOCK "$HOME/.gnupg/S.gpg-agent"
if not ss -a | grep -q "$GPG_AGENT_SOCK";
  rm -rf "$GPG_AGENT_SOCK"
  set wsl2_ssh_pageant_bin "$HOME/.ssh/wsl2-ssh-pageant.exe"
  if test -x "$wsl2_ssh_pageant_bin";
    setsid nohup socat UNIX-LISTEN:"$GPG_AGENT_SOCK,fork" EXEC:"$wsl2_ssh_pageant_bin --gpg S.gpg-agent" >/dev/null 2>&1 &
  else
    echo >&2 "WARNING: $wsl2_ssh_pageant_bin is not executable."
  end
  set --erase wsl2_ssh_pageant_bin
end
##############

if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
end
