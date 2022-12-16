THIS_DIR=$(dirname $0)
if [ ! -d $THIS_DIR/.venv ]; then
    python -m venv $THIS_DIR/.venv
fi
$THIS_DIR/.venv/bin/$*
