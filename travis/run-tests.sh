#!/usr/bin/env bash

set -e

echo "System testing of sample assemblies"

source activate testenv
conda install -y -c conda-forge numpy

py.test
