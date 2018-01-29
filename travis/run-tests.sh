#!/usr/bin/env bash

set -e

echo "System testing of sample assemblies"

source activate testenv
python -c "import numpy"
which py.test
# py.test
