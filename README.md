# Secondo Packages for Debian
This package provides the needed tools to build Debian packages for the [SECONDO](http://dna.fernuni-hagen.de/secondo/) database. 


# SECONDO build using docker
```bash
docker run -it ubuntu:18.04
apt-get update
apt-get install git vim wget rsync dpkg-dev screen -y
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
su - secondouser
/opt/secondo/bin/secondo_installer.sh
source ~/.secondorc

SecondoTTYBDB
> restore database opt from '/opt/secondo/bin/opt'
> query ten

open 
SecondoPLTTY
> open database opt
> select * from ten
> exit

screen
# Screen1
SecondoMonitor -s
# Screen2
SecondoTTYCS
> exit
StartOptServer
> exit

exit
userdel -r secondouser
```

### Misc

```bash
docker  cp 520c2a9cc927:/secondo-debian/secondo_ubuntu_1804/secondo_4.1.3-1+ubuntu1804_amd64.deb .
```
