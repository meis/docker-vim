# My Vim, Dockerized

```
function meis-vim() {
  path=`readlink -f ${1:-.}`
  file=`basename $path`
  dir=`dirname $path`
  ug=`id -u`:`id -g`
  chown="chown -R $ug /vim-home"
  docker run -ti --name meis-vim --rm \
    --user $ug \
    -v $dir:/edit \
    meis/vim \
    vim /edit/$file
}
```
