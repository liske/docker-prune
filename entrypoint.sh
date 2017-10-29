#!/bin/sh

for dom in $@; do
    echo ">>> docker $dom prune <<<"
    docker $dom prune -f
    echo
done
