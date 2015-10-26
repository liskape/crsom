#!/bin/bash
module add matlab

# jdi do naseho pracovniho adresare
cd /storage/praha1/home/liskape8/diplomka/crsom/

# spust MATLAB davkove
echo "exit(1)"|matlab -nosplash -nodisplay -nodesktop -r "metacentrum_run(),exit(0)" >$JOB_NAME.out 2>&1

if [ $? -eq 1 ] ; then
 #MATLAB skoncil s chybou
 tail -n 30 $JOB_NAME.out | mail -s "error in $JOB_NAME" $USER@arien.metacentrum.cz &
else
  mail -s "metacentrum matlab job: $JOB_NAME finnished" $USER@arien.metacentrum.cz &
fi

git add -A
git commit -m "$JOB_NAME"
git push
