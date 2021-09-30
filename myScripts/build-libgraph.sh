#!bin/bash

pkg i -y build-essential wget
pkg i -y '*sdl*' libx11
pkg i -y unstable-repo
pkg i -y guile guile-static
cp $PREFIX/include/guile/2.2/* $PREFIX/include/lib/
wget http://download.savannah.gnu.org/releases/libgraph/libgraph-1.0.2.tar.gz
tar -xvf libgraph-1.0.2.tar.gz
cd libgraph-1.0.2/
./configure --prefix=$PREFIX
make
make install
