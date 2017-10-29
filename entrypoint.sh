#!/bin/sh

while true; do
    for dom in $@; do
        echo ">>> docker $dom prune <<<"
        docker $dom prune -f
        echo
    done

    if [ -n "$SLEEP" ]; then
        echo "Sleeping for $SLEEP seconds..."
        sleep "$SLEEP"
        echo
    else
        exit 0
    fi
done
