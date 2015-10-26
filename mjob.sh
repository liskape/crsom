#!/bin/bash
#PBS -l matlab=1
#PBS -l matlab_Neural_Network_Toolbox=1


# spust MATLAB davkove
matlab -nosplash -nodisplay -nodesktop -r "poc(),exit(0)"

if [ $? -eq 1 ] ; then
 #MATLAB skoncil s chybou
 tail -n 30 $JOB_NAME.out | mail -s "error in $JOB_NAME" $USER@arien.metacentrum.cz &
else
  echo "finished" | mail -s "metacentrum matlab job: $JOB_NAME finnished" $USER@arien.metacentrum.cz &
fi
