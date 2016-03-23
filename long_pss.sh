#!/bin/bash

PROBLEMS="year_1960vs1970"
LEARNING_RATES="0.1"
EPOCHS="200 500"
NORMALIZE="4 5"
MAP_SIZE="1 0.7"

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

