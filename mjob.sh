#!/bin/bash
#PBS -l matlab=1
#PBS -l matlab_Neural_Network_Toolbox=1


cd /storage/brno2/home/$USER/matlab/

module add matlab
matlab -nojvm -nosplash -nodisplay -nodesktop -r  "metacentrum_run(),exit(0)"



