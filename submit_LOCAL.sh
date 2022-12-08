#!/bin/bash -l

# This script submits a benchmarking job to my local benchmarking box, which
# does not use a scheduler.  The target machine is:
#
#	one 8-core Apple M1 in a Mac mini 9,1 with 16 GB memory
#	total 8 cores (4 performance and 4 efficiency)
#
# The script is set up to monopolize the machine it gets, for more accurate
# benchmarking results; this means many cores will be underutilized.  Do not
# run other software at the same time as this script, so all cores are free.
# It may or may not be desirable to include "efficiency" results for 6/8 cores.
#
# Submit this job with: bash ./submit_LOCAL.sh
#
# Of course your local machine will be different in various respects; this
# script is just an example.

#
# Benjamin C. Haller, 8 August 2020

#SLIM_BENCHTHREADS="1 2 4 6 8"
#SLIM_BENCHTHREADS="1 2 4"
export SLIM_BENCHTHREADS

REPS=3

# run all models
#bash ./runall.sh ${REPS}

# run specified models
#bash ./runmulti.sh E_set_fitnessScaling_1 ${REPS}
#bash ./runmulti.sh E_set_fitnessScaling_2 ${REPS}
#bash ./runmulti.sh E_sort_integer ${REPS}
#bash ./runmulti.sh E_sum_float ${REPS}
#bash ./runmulti.sh E_sum_integer ${REPS}
#bash ./runmulti.sh E_sum_logical ${REPS}
#bash ./runmulti.sh E_sumOfMutationsOfType ${REPS}

#bash ./runmulti.sh M_neutral_WF ${REPS}
#bash ./runmulti.sh M_nonneutral_WF ${REPS}
#bash ./runmulti.sh M_turnover_nonWF ${REPS}
#bash ./runmulti.sh M_turnover_WF ${REPS}

bash ./runmulti.sh R_dnorm_1 ${REPS}
bash ./runmulti.sh R_dnorm_2 ${REPS}
bash ./runmulti.sh R_rbinom_1 ${REPS}
bash ./runmulti.sh R_rbinom_2 ${REPS}
bash ./runmulti.sh R_rbinom_3 ${REPS}
bash ./runmulti.sh R_rdunif_1 ${REPS}
bash ./runmulti.sh R_rdunif_2 ${REPS}
bash ./runmulti.sh R_rdunif_3 ${REPS}
bash ./runmulti.sh R_rexp_1 ${REPS}
bash ./runmulti.sh R_rexp_2 ${REPS}
bash ./runmulti.sh R_rnorm_1 ${REPS}
bash ./runmulti.sh R_rnorm_2 ${REPS}
bash ./runmulti.sh R_rnorm_3 ${REPS}
bash ./runmulti.sh R_rpois_1 ${REPS}
bash ./runmulti.sh R_rpois_2 ${REPS}
bash ./runmulti.sh R_runif_1 ${REPS}
bash ./runmulti.sh R_runif_2 ${REPS}
bash ./runmulti.sh R_runif_3 ${REPS}

#bash ./runmulti.sh S_interactingNeighborCount_1D ${REPS}
#bash ./runmulti.sh S_interactingNeighborCount_2D ${REPS}
#bash ./runmulti.sh S_interactingNeighborCount_3D ${REPS}
#bash ./runmulti.sh S_totalOfNeighborStrengths_1D ${REPS}
#bash ./runmulti.sh S_totalOfNeighborStrengths_2D ${REPS}
#bash ./runmulti.sh S_totalOfNeighborStrengths_3D ${REPS}

#bash ./runmulti.sh T_treeseq_edges ${REPS}
#bash ./runmulti.sh T_treeseq_simplify ${REPS}

#bash ./runmulti.sh Z_runner_test ${REPS}


