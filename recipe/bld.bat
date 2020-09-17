copy /y %RECIPE_DIR%\mkl_beta_nan.cpp .

cl.exe /c /nologo /Ox /W3 -I"%PREFIX%/Library/include" mkl_beta_nan.cpp /Fomkl_beta_nan.obj
link.exe /LIBPATH:"%PREFIX%/Library/lib" mkl_rt.lib mkl_beta_nan.obj  /OUT:mkl_beta_nan.exe
rem del mkl_beta_nan.obj

.\mkl_beta_nan.exe


%PYTHON% setup.py config install --old-and-unmanageable
if errorlevel 1 exit 1
