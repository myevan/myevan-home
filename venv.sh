THIS_DIR=$(dirname $0)
if [ ! -d .venv ]; then
    python -m venv $THIS_DIR/.venv
fi
$THIS_DIR/.venv/bin/$*
