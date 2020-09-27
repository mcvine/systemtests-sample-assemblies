#!/bin/bash

set -e

export GIT_FULL_HASH=`git rev-parse HEAD`

if [ ${USE_CACHE} == "yes" ] ; then
    source activate testenv
else
    # install dependencies
    echo ${TRAVIS_PYTHON_VERSION}
    conda config --set always_yes true
    conda update conda
    conda config --add channels conda-forge
    conda config --add channels diffpy
    conda config --add channels mantid
    conda config --add channels mcvine
    conda create -n testenv -c mcvine/label/unstable mcvine=1.4 pytest python=$TRAVIS_PYTHON_VERSION
    source activate testenv
fi
