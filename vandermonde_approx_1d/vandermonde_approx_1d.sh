#!/bin/bash
#
mkdir temp
cd temp
rm *
~/bin/$ARCH/f90split ../vandermonde_approx_1d.f90
#
for FILE in `ls -1 *.f90`;
do
  gfortran -c -g $FILE >& compiler.txt
  if [ $? -ne 0 ]; then
    echo "Errors compiling " $FILE
    exit
  fi
  rm compiler.txt
done
rm *.f90
#
ar qc libvandermonde_approx_1d.a *.o
rm *.o
#
mv libvandermonde_approx_1d.a ~/lib/$ARCH
cd ..
rmdir temp
#
echo "Library installed as ~/lib/$ARCH/libvandermonde_approx_1d.a"
