#!/bin/bash
test -n "$1" || echo "usage: ./new.sh <Title-without-Space-&-Extension> [--note]"
test -n "$1" || exit
if [[ $2 == "--note" ]]; then
    hugo new note/${1}.md --editor="vim"
else
    hugo new post/${1}.md --editor="vim"
fi

