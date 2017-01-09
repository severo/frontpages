# Installation pour Debian jessie/stretch

Installer "unes" :

´´´
git clone https://framagit.org/severo/unes.git
´´´

Installer https://github.com/jeanphix/Ghost.py, dans un environnement virtuel (Python 2.7), en se positionnant à la racine du répertoire "unes" :

´´´
cd unes/
sudo apt install python-virtualenv make cmake gcc g++ python-dev qt4-qmake qt4-default xvfb
virtualenv unes_ghost
cd unes_ghost/
./bin/pip install pyside # Très long !
./bin/pip install ghost.py --pre
´´´
