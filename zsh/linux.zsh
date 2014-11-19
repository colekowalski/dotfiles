## stop processing if we are not running on linux
if [[ ! "$OSTYPE" == "linux-gnu" ]]; then
    return
fi

export EDITOR='vim'
export GIT_EDITOR='vim'
