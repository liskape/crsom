#!/bin/bash
#PBS -l matlab=1
#PBS -l matlab_Neural_Network_Toolbox=1
#PBS -l mem=1gb
#PBS -m e
#PBS -l nodes=1#excl
#PBS -l nodes=luna48.fzu.cz

version=`git rev-parse --abbrev-ref HEAD`

export version

qsub -v version -N "benchmark-$version" benchmark-one.sh
