if [ ! -f venv/bin/$1 ]; then
    if [ ! -d env ]; then
        [ -f .python-version ] || pyenv local 3.6.9
        python -m venv venv
    fi
fi
venv/bin/$*
