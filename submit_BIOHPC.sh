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

REPS=1

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
bash ./runmulti.sh M_mut_fitness_1 ${REPS}
bash ./runmulti.sh M_mut_fitness_2 ${REPS}
#bash ./runmulti.sh M_mut_tallies ${REPS}
#bash ./runmulti.sh M_turnover_nonWF ${REPS}
#bash ./runmulti.sh M_turnover_WF ${REPS}

#bash ./runmulti.sh R_dnorm_1 ${REPS}
#bash ./runmulti.sh R_dnorm_2 ${REPS}
#bash ./runmulti.sh R_rbinom_1 ${REPS}
#bash ./runmulti.sh R_rbinom_2 ${REPS}
#bash ./runmulti.sh R_rbinom_3 ${REPS}
#bash ./runmulti.sh R_rdunif_1 ${REPS}
#bash ./runmulti.sh R_rdunif_2 ${REPS}
#bash ./runmulti.sh R_rdunif_3 ${REPS}
#bash ./runmulti.sh R_rexp_1 ${REPS}
#bash ./runmulti.sh R_rexp_2 ${REPS}
#bash ./runmulti.sh R_rnorm_1 ${REPS}
#bash ./runmulti.sh R_rnorm_2 ${REPS}
#bash ./runmulti.sh R_rnorm_3 ${REPS}
#bash ./runmulti.sh R_rpois_1 ${REPS}
#bash ./runmulti.sh R_rpois_2 ${REPS}
#bash ./runmulti.sh R_runif_1 ${REPS}
#bash ./runmulti.sh R_runif_2 ${REPS}
#bash ./runmulti.sh R_runif_3 ${REPS}

#bash ./runmulti.sh S_interactingNeighborCount_1D ${REPS}
#bash ./runmulti.sh S_interactingNeighborCount_2D ${REPS}
#bash ./runmulti.sh S_interactingNeighborCount_3D ${REPS}
#bash ./runmulti.sh S_totalOfNeighborStrengths_1D ${REPS}
#bash ./runmulti.sh S_totalOfNeighborStrengths_2D ${REPS}
#bash ./runmulti.sh S_totalOfNeighborStrengths_3D ${REPS}

#bash ./runmulti.sh T_treeseq_edges ${REPS}
#bash ./runmulti.sh T_treeseq_simplify ${REPS}

#bash ./runmulti.sh Z_runner_test ${REPS}

# give the reserved node back to the cluster; replace the reservation # here
/programs/bin/labutils/endres.pl 119124

