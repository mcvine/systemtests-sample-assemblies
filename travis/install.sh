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
    conda config --add channels mcvine
    conda create -n testenv python=$TRAVIS_PYTHON_VERSION
    source activate testenv
    const install numpy
    conda install -c mcvine/label/unstable mcvine mcvine.workflow mcvine.phonon
    conda install pytest
fi
