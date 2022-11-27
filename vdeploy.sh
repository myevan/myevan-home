THIS_DIR=$(dirname $0)

if [ ! -d $THIS_DIR/site ]; then
    git clone git@github.com:myevan/myevan.github.io $THIS_DIR/site
fi

if [ ! -d $THIS_DIR/site/.git ]; then
    echo NOT_BOUND_SITE.GIT
    exit
fi

$THIS_DIR/vmkdocs.sh build

pushd $THIS_DIR/site
git add .
TIME=`date +"%y-%m-%d %H:%M:%S"`
HOST="$USER@`hostname`"
git commit -a -m "sync on $HOST at $TIME"
git push origin master
popd
