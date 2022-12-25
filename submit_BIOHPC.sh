#!/bin/bash -l

# This script submits a benchmarking job to Cornell's BioHPC cluster, which
# does not use a scheduler (you reserve a whole node).  The target machine is:
#
#	two 20-core (40-hyperthreaded) Intel Xeon Gold 6148 2.4GHz
#	total 40 physical cores, 80 virtual cores (cbsulm21-22,27-28)
#
# The script is set up to monopolize the machine it gets, for more accurate
# benchmarking results; this means many cores will be underutilized.  That's life.
# It may or may not be desirable to include hyperthreaded results for 60/80 cores.
#
# Submit this job with: nohup bash ./submit_BIOHPC.sh >& hpclog.txt &
#
# See https://biohpc.cornell.edu/lab/lab.aspx for more info on this
# cluster.  Of course your cluster will be different in various respects; this
# script is just an example.

#
# Benjamin C. Haller, 8 August 2020

#SLIM_BENCHTHREADS="1 2 5 10 20 40 60 80"
SLIM_BENCHTHREADS="1 2 5 10 20 40"
export SLIM_BENCHTHREADS

bash ./submit_TASKS.sh

# give the reserved node back to the cluster
/programs/bin/labutils/endres.pl

