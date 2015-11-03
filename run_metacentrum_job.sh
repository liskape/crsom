#!/bin/bash


# push
ssh liskape8@skirit.ics.muni.cz


# pull


cp  /storage/brno2/home/$USER/matlab/

qsub mjob.sh


git clean -f


qsub  mjob.sh -d $PWD -q long
