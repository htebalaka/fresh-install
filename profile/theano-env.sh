#!/bin/bash
# http://deeplearning.net/software/theano/install.html#in-academia-enthought-python-distribution-epd
# first get enthought python distribution
#sudo easy_install pip
#sudo pip install virtualenv
# http://www.australsounds.com/2013/01/theano-pylearn2.html
#

# venv -u ~/theano-env # after a canopy update

function epd-nukeenv {
   rm -rf ~/theano-env
   epd-newenv ~/theano-env
}

#https://support.enthought.com/entries/25928889-Issues-with-virtual-environments-venv-in-Canopy-1-2-and-1-3
function epd-newenv {
   source ~/Library/Enthought/Canopy_64bit/User/bin/activate
   canopy_cli venv $1
   enpkg --prefix $1 enstaller
   epd-installdeps $1
}

#https://support.enthought.com/entries/22415022-Using-enpkg-to-update-Canopy-EPD-packages
function epd-installdeps {
   cd $1
   source bin/activate
   enpkg --userpass
   enpkg ipython readline #readline adds color/tab completion to ipython
   enpkg numpy scipy sympy nose pydot
   epd-installml $1
}

#install theano/pylearn2
function epd-installml {
   cd $1
   git clone git://github.com/Theano/Theano.git
   pip install -e Theano/.
   git clone git://github.com/lisa-lab/pylearn2.git
   pip install -e pylearn2/.
}

#http://pyetc.wordpress.com/2013/01/09/installing-the-enthought-python-distribution-with-opencv/
