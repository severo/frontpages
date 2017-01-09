# Installation pour Debian jessie/stretch

Installer "unes" :

```
git clone https://framagit.org/severo/unes.git
sudo apt install python-virtualenv make cmake gcc g++ python-dev qt4-qmake qt4-default xvfb python-qt4 python-sip-dev
```

Installer un environnement virtuel (Python 2.7), en se positionnant à la racine du répertoire "unes" :

```
cd unes/
virtualenv unes
./unes/bin/pip install configobj
ln -s /usr/lib/python2.7/dist-packages/PyQt4/ unes/lib/python2.7/site-packages/ # http://stackoverflow.com/a/28850104/7351594
```

Pour Debian jessie:

```
ln -s /usr/lib/python2.7/dist-packages/sip.so unes/lib/python2.7/site-packages/ # http://stackoverflow.com/a/28850104/7351594
```

Pour Debian stretch:

```
ln -s /usr/lib/python2.7/dist-packages/sip.x86_64-linux-gnu.so unes/lib/python2.7/site-packages/ # http://stackoverflow.com/a/28850104/7351594
```

# Configuration

Copier et modifier le fichier de configuration :

```
cp config.ini.example config.ini
nano config.ini
```

# Test

Lancer la capture d'écran :

```
xvfb-run --auto-servernum --server-num=1 ./unes_screenshot.py
```
