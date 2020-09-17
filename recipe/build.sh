#!/bin/bash -x
cp $RECIPE_DIR/mkl_beta_nan.cpp .
gcc -c -std=c++17 -I$PREFIX/include mkl_beta_nan.cpp -o mkl_beta_nan.o
gcc -L$PREFIX/lib -lmkl_rt -lstdc++ -Wl,-rpath,$CONDA_PREFIX/lib mkl_beta_nan.o -o mkl_beta_nan.exe

./mkl_beta_nan.exe

$PYTHON setup.py config build install --old-and-unmanageable

