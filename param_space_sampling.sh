#!/bin/bash
#PBS -l matlab=1
#PBS -l matlab_Neural_Network_Toolbox=1
#PBS -l mem=1gb
#PBS -m e
#PBS -l nodes=1#excl

PROBLEMS="db-stones-acdc met_mad_la met_mad_la_random1 off-sexp eminem-chemb-am"
LEARNING_RATES="0.1 0.05"
EPOCHS="1500 2500"
NORMALIZE="4 5"
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

          qsub -v p,lr,e,n,ms -N "$p-lr$lr-e$e-n$n-ms$ms" mjob-one.sh
       done
      done
    done
  done
done

