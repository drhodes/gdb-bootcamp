#!/usr/bin/env bash

U=vagrant
UHOME=/home/$U

apt-get update
apt-get install -y build-essential gdb libgit2-dev unzip emacs 
apt-get install -y trash-cli # a kinder rm.

# setup user library path

mkdir -p $UHOME/deps

# setup include and linker paths
CRITPATH=$UHOME/deps/criterion-v2.3.2

echo '# criterion setup' >> ~/.bashrc
echo 'export C_INCLUDE_PATH=${C_INCLUDE_PATH}:'$CRITPATH/include >> $UHOME/.bashrc
echo 'export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:'$CRITPATH/lib >> $UHOME/.bashrc
echo 'export LIBRARY_PATH=${LIBRARY_PATH}:'$CRITPATH/lib >> $UHOME/.bashrc

# get criterion
wget --quiet "https://github.com/Snaipe/Criterion/releases/download/v2.3.2/criterion-v2.3.2-linux-x86_64.tar.bz2"
tar xvf criterion-v2.3.2-linux-x86_64.tar.bz2 -C $UHOME/deps
rm -f criterion-v2.3.2-linux-x86_64.tar.bz2

# setup koans.
mkdir -p $UHOME/koans
wget --quiet "https://github.com/c-koans/c_koans/archive/v0.3.1.zip"
unzip v0.3.1.zip -d $UHOME/koans
rm -f v0.3.1.zip

# user owns all the things in home.
chown $U -R $UHOME

