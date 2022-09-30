#!/bin/bash -l

# This script submits a benchmarking job to my local benchmarking box, which
# does not use a scheduler.  The target machine is:
#
#	one 8-core Apple M1 in a Mac mim 9,1 with 16 GB memory
#	total 8 cores (4 performance and 4 efficiency)
#
# The script is set up to monopolize the machine it gets, for more accurate
# benchmarking results; this means many cores will be underutilized.  Do not
# run other software at the same time as this script, so all cores are free.
#
# Submit this job with: bash ./submit_LOCAL.sh
#
# Of course your local machine will be different in various respects; this
# script is just an example.

#
# Benjamin C. Haller, 8 August 2020

SLIM_BENCHTHREADS="1 2 4 6 8"
export SLIM_BENCHTHREADS

# run all models
#bash ./runall.sh 5

# run specified models
#bash ./runmulti.sh neutral_WF 5
#bash ./runmulti.sh nonneutral_WF 5
#bash ./runmulti.sh T_CalculateAllDistances1D 5
#bash ./runmulti.sh T_CalculateAllDistances2D 5
#bash ./runmulti.sh T_CalculateAllDistances3D 5
#bash ./runmulti.sh T_CalculateAllStrengths1D 5
#bash ./runmulti.sh T_CalculateAllStrengths2D 5
#bash ./runmulti.sh T_CalculateAllStrengths3D 5
bash ./runmulti.sh T_set_fitnessScaling_1 5
bash ./runmulti.sh T_set_fitnessScaling_2 5
bash ./runmulti.sh T_sum_float 5
bash ./runmulti.sh T_sum_integer 5
bash ./runmulti.sh T_sum_logical 5
bash ./runmulti.sh T_sumOfMutationsOfType 5
#bash ./runmulti.sh treeseq_edges 5
#bash ./runmulti.sh treeseq_simplify 5
#bash ./runmulti.sh turnover_nonWF 5
#bash ./runmulti.sh turnover_WF 5


