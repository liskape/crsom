#!/bin/bash


git add *.m

git adda *.sh


$message = head -7 metacentrum_run.m | tail -5 | head -4

git commit -m $message

git push
