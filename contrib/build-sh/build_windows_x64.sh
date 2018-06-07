#!/bin/sh
echo '#################################################'
echo '# Building Aither Core                          #'
echo '#################################################'
cd ../..
AIT_ROOT=$(pwd)
sudo apt-get -y install g++-mingw-w64-i686 mingw-w64-i686-dev g++-mingw-w64-x86-64 mingw-w64-x86-64-dev
cd depends
make HOST=x86_64-w64-mingw32 -j4
cd ..
./autogen.sh
./configure --prefix=`pwd`/depends/x86_64-w64-mingw32
make
mkdir -p $AIT_ROOT/release/
cp $AIT_ROOT/src/aitherd.exe $AIT_ROOT/release/
cp $AIT_ROOT/src/aither-cli.exe $AIT_ROOT/release/
cp $AIT_ROOT/src/aither-tx.exe $AIT_ROOT/release/
cp $AIT_ROOT/src/qt/aither-qt.exe $AIT_ROOT/release/