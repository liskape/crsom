#!/bin/bash
#PBS -l matlab=1
#PBS -l matlab_Neural_Network_Toolbox=1
#PBS -l mem=1gb
#PBS -m e
#PBS -l nodes=1
#PBS -l nodes=luna48.fzu.cz

cd /storage/brno2/home/$USER/matlab/
module add matlab
matlab -singleCompThread -nosplash  -nodisplay -nodesktop -r  "benchmark_implementation('benchmark', '$version'),exit(0)"
