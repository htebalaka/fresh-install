#!/bin/bash

# http://deeplearning.net/software/theano/install_ubuntu.html#install-ubuntu
function python-tests {
   numpy-nose && pause && scipy-nose && pause && theano-nose
}
function theano-tests {
   theanoTest1 && pause && theanoTest2 && pause && theanoTest3 && pause && speed-test
}

# helper functions for nose tests
function numpy-nose {
   python -c "import numpy; numpy.test()"
}
function scipy-nose {
   python -c "import scipy; scipy.test()"
}
function theano-nose {
   python -c "import theano; theano.test()"
}
function speed-test {
   python `python -c "import os, theano; print os.path.dirname(theano.__file__)"`/misc/check_blas.py
}

# helper functions for gpu tests
function theanoTest1 {
   python -c "from TestingTheanoWithGPU import *; returningAHandleToDeviceAllocatedData()"
}
function theanoTest2 {
   python -c "from TestingTheanoWithGPU import *; testingTheanoWithTheGPU()"
}
function theanoTest3 {
   python -c "from TestingTheanoWithGPU import *; changingTheValuesOfSharedVariables"
}
function pause {
   echo "Press enter to continue" | read
}
