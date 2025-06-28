#!/usr/bin/env bash

scriptdir=$(cd "$(dirname -- "$0")" ; pwd -P)

function enact_link() {
    if [[ -e "$2" && ! -L "$2" ]] ; then
        echo "$2 exists and is not a simlink. not replacing." >&2
        return 1
    fi

    [[ -L "$2" ]] && rm "$2"

    ln -sv "${scriptdir}/$1" "$2"
}

mkdir -p ~/.config
enact_link nvim ~/.config/nvim

