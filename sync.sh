pushd site
TIME=`date +"%y-%m-%d %H:%M:%S"`
HOST="$USER@`hostname`"
git commit -a -m "sync on $HOST at $TIME"
git push origin master
popd
