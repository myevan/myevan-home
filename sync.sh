if [ ! -d site ]; then
    git clone https://github.com/myevan/myevan.github.io site
fi

mkdocs build 
pushd site
git add .
TIME=`date +"%y-%m-%d %H:%M:%S"`
HOST="$USER@`hostname`"
git commit -a -m "sync on $HOST at $TIME"
git push origin master
popd
