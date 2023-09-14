#!/bin/bash -x
export MKLROOT=${PREFIX}
$PYTHON -m pip install --no-build-isolation --no-deps .
