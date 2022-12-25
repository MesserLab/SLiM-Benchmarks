#!/bin/bash -l

# This script submits a benchmarking job to my local benchmarking box, which
# does not use a scheduler.  The target machine is:
#
#	MacBook Pro 2019 (MacBookPro16,1), 8-core Intel Core i9, 64 GB
#
# Each core supports hyperthreading, but we do not use it in this script.
# The script is set up to monopolize the machine it gets, for more accurate
# benchmarking results; this means many cores will be underutilized.  Do not
# run other software at the same time as this script, so all cores are free.
#
# Submit this job with: bash ./submit_MACBOOK.sh

#
# Benjamin C. Haller, 25 December 2022

SLIM_BENCHTHREADS="1 2 4 6 8"
export SLIM_BENCHTHREADS

bash ./submit_TASKS.sh
