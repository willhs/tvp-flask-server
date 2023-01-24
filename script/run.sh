#!/bin/bash

set -e

# check if no-venv flag is set
if [ "$1" = "--no-venv" ]; then
    echo "running without virtual environment"
else
    # check if virtual environment exists
    if [ ! -d ".venv" ]; then
        echo "virtual environment not found, creating one"
        virtualenv --python=python3 .venv
    fi

    # activate virtual environment
    . .venv/bin/activate
fi

pip install -r requirements.txt

python __main__.py
