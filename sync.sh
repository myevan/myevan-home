mkdocs build 
pushd site
git add .
TIME=`date +"%y-%m-%d %H:%M:%S"`
HOST="$USER@`hostname`"
git commit -a -m "sync on $HOST at $TIME"
git push origin master
popd
