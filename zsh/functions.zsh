function _open_in_multiplexer {
  local name=$1
  local cmd=$2
  if [[ $TMUX != "" ]]; then
    tmux new-window -a -n $name "$cmd"
  else
    screen -X screen -t $name sh -c "$cmd"
  fi
}

## open a list of servers in an active tmux or screen session.
## hosts may be supplied as args or on stdin
function ns {
  ## servers supplied as arguments
  if [ $# -gt 0 ]; then
    for server in ${@:1}; do
      _open_in_multiplexer $server "ssh -At -o "\""ConnectTimeout 3"\"" $server"
    done

  ## servers supplied on stdin
  else
    while read server; do
      _open_in_multiplexer $server "ssh -At -o "\""ConnectTimeout 3"\"" $server"
    done
  fi
}

## connect to a host and open/connect to a tmux session
function tssh {
  local session_name=$USER
  if [ -z $session_name ]; then
    session_name=$(whoami)
  fi

  while getopts ":s:" opt; do
    case $opt in
      s)
        session_name="$OPTARG"
        ;;
      \?)
        echo "Invalid option: -$OPTARG" >&2
        return 1
        ;;
      :)
        echo "Option -$OPTARG requires an argument" >&2
        return 1
        ;;
    esac
  done

  shift $((OPTIND-1))

  ssh -t $@ "tmux attach -t $session_name || tmux new-session -s $session_name"
}
