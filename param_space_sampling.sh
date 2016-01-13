#!/bin/bash
#PBS -l matlab=1
#PBS -l matlab_Neural_Network_Toolbox=1
#PBS -l mem=1gb
#PBS -m e
#PBS -l nodes=1#excl

# PROBLEMS="katy-soad-2 off-sexp"
# LEARNING_RATES="0.03 0.1 0.3"
# EPOCHS="300 1000 2000"
# NORMALIZE="3 4"
# MAP_SIZE="1"

PROBLEMS="off-sexp"
LEARNING_RATES="0.03"
EPOCHS="1"
NORMALIZE="4"
MAP_SIZE="1"

for p in `echo $PROBLEMS`
do
  for lr in `echo $LEARNING_RATES`
  do
    for e in `echo $EPOCHS`
    do
      for n in `echo $NORMALIZE`
      do
        for ms in `echo $MAP_SIZE`
        do
          export p
          export lr
          export e
          export n
          export ms

          qsub -v p,lr,e,n,ms -N "job-p:$p-lr:$lr-e:$e-n:$n-ms:$ms" mjob-one.sh
       done
      done
    done
  done
done

