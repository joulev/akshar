#!/usr/bin/env sh

sudo apt-get install unzip

wget https://sites.google.com/site/bayaryn/siddhanta.ttf
sudo cp siddhanta.ttf /usr/share/fonts/truetype

wget https://www.fontsquirrel.com/fonts/download/linux-biolinum
unzip linux-biolinum.zip -d biolinum
cd biolinum
sudo cp *.otf /usr/share/fonts/opentyle
cd ..

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
unzip Hack -d hack
cd hack
rm -f *Windows\ Compatible.ttf
sudo cp *.ttf /usr/share/fonts/truetype
cd ..