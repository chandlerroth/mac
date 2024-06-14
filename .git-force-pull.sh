#!/bin/bash

read -p "[WARN] Are you sure you want to force pull? (Y/n) " confirmation

if [[ "$confirmation" == "Y" ]]; then
    echo "Force pulling..."
    git fetch origin
    git reset origin/"$(git branch --show-current)" --hard
else
    echo "Force pull aborted"
    exit 1
fi
