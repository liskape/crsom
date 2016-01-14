#!/bin/bash
#PBS -l matlab=1
#PBS -l matlab_Neural_Network_Toolbox=1
#PBS -l mem=1gb
#PBS -m e
#PBS -l nodes=1#excl

PROBLEMS="off-sexp"
LEARNING_RATES="10"
EPOCHS="10"
NORMALIZE="1"
MAP_SIZE="0.5"

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

