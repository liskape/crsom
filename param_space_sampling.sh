#!/bin/bash
#PBS -l matlab=1
#PBS -l matlab_Neural_Network_Toolbox=1
#PBS -l mem=1gb
#PBS -m e
#PBS -l nodes=1#excl

PROBLEMS="off-sexp katy-soad-2"
LEARNING_RATES="0.01 0.05 0.1"
EPOCHS="1 500 1500 5000"
NORMALIZE="3 4"
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

          qsub -v p,lr,e,n,ms -N "p:$p_lr:$lr_e:$e_n:$n_ms:$ms" mjob-one.sh
       done
      done
    done
  done
done

