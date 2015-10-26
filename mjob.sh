#!/bin/bash
module add matlab

while 1
    [tf msg] = license('checkout','Neural_Network_Toolbox');
    if tf==1, break, end
    display(strcat(datestr(now),' waiting for licence '));
    pause(5);
end

# spust MATLAB davkove
matlab -nosplash -nodisplay -nodesktop -r "poc(),exit(0)"

if [ $? -eq 1 ] ; then
 #MATLAB skoncil s chybou
 tail -n 30 $JOB_NAME.out | mail -s "error in $JOB_NAME" $USER@arien.metacentrum.cz &
else
  mail -s "metacentrum matlab job: $JOB_NAME finnished" $USER@arien.metacentrum.cz &
fi
