#/bin/bash
#
# This script creates a debian package of the swi-prolog package
# that can be used with secondo
#####################################################################

# Install dependencies
apt-get install flex bison gcc g++ libdb5.1 libdb5.1-dev libdb5.1++ libdb5.1++-dev db5.1-util libjpeg62 libjpeg62-dev libgsl0-dev libreadline-dev librecode-dev libgmp-dev libncurses-dev libxml2-dev libboost-all-dev build-essential debhelper fakeroot openjdk-7-jdk libxml2 libxml2-dev wget 

VER=v400

if [ ! -f secondo-$VER-LAT1.tgz ]; then
    wget http://dna.fernuni-hagen.de/Secondo.html/files/Sources/secondo-$VER-LAT1.tgz 
    tar -xzf secondo-$VER-LAT1.tgz 
fi

cd secondo

# Link our debian files to the package
if [ ! -h debian ]; then
   rmdir debian
   ln -s ../debian debian
fi 

dpkg-buildpackage -rfakeroot -nc -b
