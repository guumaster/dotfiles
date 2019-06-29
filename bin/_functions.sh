
# check for sudo permissions or exit
function check_sudo() {
    return $(sudo -v)
}

# exit if the command is not called with "sudo" prefix
function check_run_with_sudo() {
    if [[ $(id -u) == 0 ]]; then
      if [[ -z "$SUDO_COMMAND" ]]; then
          echo 'Error: you need to run the script with sudo.'
          exit 1
      fi
    else
      echo 'Error: you need to run the script with sudo.'
      exit 1
    fi
}

function check_required_cmd() {
    command -v $1 >/dev/null 2>&1 || { echo >&2 "'$1' command is required but it's not installed. Aborting.";  exit 1; }
}

function cmd_installed() {
    if command -v $1 >/dev/null 2>&1; then
        echo 1
    else
        echo 0
    fi
}

redirect_cmd() {
    if [ -n "$VERBOSE" ]; then "$@"; else "$@" > /dev/null; fi
}

