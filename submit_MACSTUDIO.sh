#!/bin/bash -l

# This script submits a benchmarking job to my local benchmarking box, which
# does not use a scheduler.  The target machine is:
#
#	Mac Studio 2022 (Mac13,2), 20-core M1 Ultra, 128 GB
#	the 20 cores are 16 performance cores and 4 efficiency cores
#
# The script is set up to monopolize the machine it gets, for more accurate
# benchmarking results; this means many cores will be underutilized.  Do not
# run other software at the same time as this script, so all cores are free.
# This script targets the performance cores using OMP_PLACES, with place
# indices for the performance cores found using hwloc-ls.  We set OMP_PROC_BIND
# to "spread" to try to give each thread its own L2 cache, when possible.
# We do not utilize the "efficiency" cores of the machine; we leave them for
# other apps, the kernel, etc., so our cores are consistent in performance.
#
# Submit this job with: bash ./submit_MACSTUDIO.sh

#
# Benjamin C. Haller, 25 December 2022

SLIM_BENCHTHREADS="1 2 4 6 8 12 16"
export SLIM_BENCHTHREADS

export OMP_PLACES="{2:8},{12:8}"
export OMP_PROC_BIND=spread

bash ./submit_TASKS.sh
