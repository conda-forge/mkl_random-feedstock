#!/bin/bash -x
cp $RECIPE_DIR/mkl_beta_nan.cpp .
gcc -c -I$PREFIX/include mkl_beta_nan.cpp -o mkl_beta_nan.o
gcc -L$PREFIX/lib -lmkl_rt mkl_beta_nan.o -o mkl_beta_nan.exe

./mkl_beta_nan.exe

$PYTHON setup.py config build install --old-and-unmanageable

