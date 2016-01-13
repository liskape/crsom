#!/bin/bash
#PBS -l matlab=1
#PBS -l matlab_Neural_Network_Toolbox=1
#PBS -l mem=1gb
#PBS -m e
#PBS -l nodes=1#excl


cd /storage/brno2/home/$USER/matlab/
module add matlab
matlab -nojvm -nosplash  -nodisplay -nodesktop -r  "metacentrum_run(),exit(0)"



