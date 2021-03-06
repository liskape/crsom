#!/bin/bash

PROBLEMS="year_2010vs1970_small year_1960vs1970 user_4e11f"
LEARNING_RATES="0.01 0.05 0.1"
EPOCHS="2000 5000 10000"
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

          qsub -v p,lr,e,n,ms -N "$p-lr$lr-e$e-n$n-ms$ms"  -q long mjob-one-long.sh
       done
      done
    done
  done
done

