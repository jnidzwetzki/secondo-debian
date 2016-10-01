#/bin/bash
#
# This script creates a debian package of the swi-prolog package
# that can be used with secondo
#####################################################################

# Install dependencies
apt-get install flex bison gcc g++ libdb5.3 libdb5.3-dev libdb5.3++ libdb5.3++-dev db5.3-util libjpeg62 libjpeg62-dev libgsl0-dev libreadline-dev librecode-dev libgmp-dev libncurses-dev libxml2-dev libboost-all-dev build-essential debhelper fakeroot openjdk-8-jdk libxml2 libxml2-dev wget swi-prolog-nox swi-prolog-java 

VER=v400

if [ ! -f secondo-$VER-LAT1.tgz ]; then
    wget http://dna.fernuni-hagen.de/Secondo.html/files/Sources/secondo-$VER-LAT1.tgz 
    tar -xzf secondo-$VER-LAT1.tgz 
fi


# Activate additional algebras
sed -i 's|#ALGEBRA_DIRS += MapMatching|ALGEBRA_DIRS += MapMatching|g' secondo/makefile.algebras
sed -i 's|#ALGEBRAS     += MapMatchingAlgebra|ALGEBRAS     += MapMatchingAlgebra|g' secondo/makefile.algebras
sed -i 's|#ALGEBRA_DEPS += xml2|ALGEBRA_DEPS += xml2|g' secondo/makefile.algebras

sed -i 's|#ALGEBRA_DIRS += OSM|ALGEBRA_DIRS += OSM|g' secondo/makefile.algebras
sed -i 's|#ALGEBRAS     += OsmAlgebra|ALGEBRAS     += OsmAlgebra|g' secondo/makefile.algebras
sed -i 's|#ALGEBRA_DEPS += xml2|ALGEBRA_DEPS += xml2|g' secondo/makefile.algebras

sed -i 's|#ALGEBRA_DEP_DIRS += /usr/lib/libxml2|ALGEBRA_DEP_DIRS += /usr/lib/libxml2|g' secondo/makefile.algebras
sed -i 's|#ALGEBRA_INCLUDE_DIRS += /usr/include/libxml2|ALGEBRA_INCLUDE_DIRS += /usr/include/libxml2|g' secondo/makefile.algebras

sed -i 's|#ALGEBRA_DIRS += MP3|ALGEBRA_DIRS += MP3|g' secondo/makefile.algebras
sed -i 's|#ALGEBRAS     += MP3Algebra|ALGEBRAS     += MP3Algebra|g' secondo/makefile.algebras

cd secondo

# Link our debian files to the package
if [ ! -h debian ]; then
   rmdir debian
   ln -s ../debian debian
fi 

dpkg-buildpackage -rfakeroot -nc -b
