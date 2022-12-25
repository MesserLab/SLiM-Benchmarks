#!/bin/bash -l

# This script submits a standard set of tasks for a benchmarking job.
#
# Do not run this directly; use the other submit_* scripts.

#
# Benjamin C. Haller, 8 August 2020

#SLIM_BENCHTHREADS is assumed to be defined externally

REPS=2

# run all models
#bash ./runall.sh ${REPS}

# run specified models
bash ./runmulti.sh E_set_fitnessScaling_1 ${REPS}
bash ./runmulti.sh E_set_fitnessScaling_2 ${REPS}
bash ./runmulti.sh E_sort_integer ${REPS}
bash ./runmulti.sh E_sum_float ${REPS}
bash ./runmulti.sh E_sum_integer ${REPS}
bash ./runmulti.sh E_sum_logical ${REPS}
bash ./runmulti.sh E_sumOfMutationsOfType ${REPS}

bash ./runmulti.sh M_neutral_WF ${REPS}
bash ./runmulti.sh M_nonneutral_WF ${REPS}
bash ./runmulti.sh M_mut_fitness_1 ${REPS}
bash ./runmulti.sh M_mut_fitness_2 ${REPS}
bash ./runmulti.sh M_mut_tallies ${REPS}
bash ./runmulti.sh M_survival_1 ${REPS}
bash ./runmulti.sh M_survival_2 ${REPS}
bash ./runmulti.sh M_turnover_nonWF ${REPS}
bash ./runmulti.sh M_turnover_WF ${REPS}

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

bash ./runmulti.sh S_clippedIntegral_1D ${REPS}
bash ./runmulti.sh S_clippedIntegral_2D ${REPS}
bash ./runmulti.sh S_interactingNeighborCount_1D ${REPS}
bash ./runmulti.sh S_interactingNeighborCount_2D ${REPS}
bash ./runmulti.sh S_interactingNeighborCount_3D ${REPS}
bash ./runmulti.sh S_localPopulationDensity_1D ${REPS}
bash ./runmulti.sh S_localPopulationDensity_2D ${REPS}
bash ./runmulti.sh S_neighborCount_1D ${REPS}
bash ./runmulti.sh S_neighborCount_2D ${REPS}
bash ./runmulti.sh S_neighborCount_3D ${REPS}
bash ./runmulti.sh S_totalOfNeighborStrengths_1D ${REPS}
bash ./runmulti.sh S_totalOfNeighborStrengths_2D ${REPS}
bash ./runmulti.sh S_totalOfNeighborStrengths_3D ${REPS}

bash ./runmulti.sh T_treeseq_edges ${REPS}
bash ./runmulti.sh T_treeseq_simplify ${REPS}

#bash ./runmulti.sh Z_runner_test ${REPS}


