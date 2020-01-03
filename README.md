# Secondo Packages for Debian
This package provides the needed tools to build Debian packages for the [SECONDO](http://dna.fernuni-hagen.de/secondo/) database. 


# SECONDO build using docker
```bash
docker run -it ubuntu:18.04
apt-get update
apt-get install git vim wget rsync dpkg-dev -y
git config --global user.name "Jan Nidzwetzki"
git config --global user.email jnidzwetzki@gmx.de
git clone https://github.com/jnidzwetzki/secondo-debian.git
cd secondo-debian/ubuntu_1804
./build.sh
```

# Testing 
```bash
dpkg -i secondo_*.deb
useradd -m secondouser -s /bin/bash
su secondouser
/opt/secondo/bin/secondo_installer.sh
SecondoTTYBDB
SecondoPLTTY
exit
userdel -r secondouser
```
