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
bash ./runmulti.sh C_containsMarkerMutation ${REPS}
bash ./runmulti.sh C_countOfMutationsOfType_G ${REPS}
bash ./runmulti.sh C_countOfMutationsOfType_I ${REPS}
bash ./runmulti.sh C_individualsWithPedigreeIDs_1 ${REPS}
bash ./runmulti.sh C_individualsWithPedigreeIDs_2 ${REPS}
bash ./runmulti.sh C_relatedness ${REPS}
bash ./runmulti.sh C_sampleIndividuals_1 ${REPS}
bash ./runmulti.sh C_sampleIndividuals_2 ${REPS}
bash ./runmulti.sh C_set_fitnessScaling_1 ${REPS}
bash ./runmulti.sh C_set_fitnessScaling_2 ${REPS}
bash ./runmulti.sh C_sumOfMutationsOfType ${REPS}

bash ./runmulti.sh D_clippedIntegral_1D ${REPS}
bash ./runmulti.sh D_clippedIntegral_2D ${REPS}
bash ./runmulti.sh D_interactingNeighborCount_1D ${REPS}
bash ./runmulti.sh D_interactingNeighborCount_2D ${REPS}
bash ./runmulti.sh D_interactingNeighborCount_3D ${REPS}
bash ./runmulti.sh D_localPopulationDensity_1D ${REPS}
bash ./runmulti.sh D_localPopulationDensity_2D ${REPS}
bash ./runmulti.sh D_neighborCount_1D ${REPS}
bash ./runmulti.sh D_neighborCount_2D ${REPS}
bash ./runmulti.sh D_neighborCount_3D ${REPS}

bash ./runmulti.sh E_abs_float ${REPS}
bash ./runmulti.sh E_ceil ${REPS}
bash ./runmulti.sh E_exp_float ${REPS}
bash ./runmulti.sh E_floor ${REPS}
bash ./runmulti.sh E_log_float ${REPS}
bash ./runmulti.sh E_log10_float ${REPS}
bash ./runmulti.sh E_log2_float ${REPS}
bash ./runmulti.sh E_round ${REPS}
bash ./runmulti.sh E_sqrt_float ${REPS}
bash ./runmulti.sh E_sum_float ${REPS}
bash ./runmulti.sh E_sum_integer ${REPS}
bash ./runmulti.sh E_sum_logical ${REPS}
bash ./runmulti.sh E_trunc ${REPS}

bash ./runmulti.sh X_max_integer ${REPS}
bash ./runmulti.sh X_max_float ${REPS}
bash ./runmulti.sh X_min_integer ${REPS}
bash ./runmulti.sh X_min_float ${REPS}
bash ./runmulti.sh X_pmax_integer_1 ${REPS}
bash ./runmulti.sh X_pmax_integer_2 ${REPS}
bash ./runmulti.sh X_pmax_float_1 ${REPS}
bash ./runmulti.sh X_pmax_float_2 ${REPS}
bash ./runmulti.sh X_pmin_integer_1 ${REPS}
bash ./runmulti.sh X_pmin_integer_2 ${REPS}
bash ./runmulti.sh X_pmin_float_1 ${REPS}
bash ./runmulti.sh X_pmin_float_2 ${REPS}

bash ./runmulti.sh V_match_integer ${REPS}
bash ./runmulti.sh V_match_float ${REPS}
bash ./runmulti.sh V_match_string ${REPS}
bash ./runmulti.sh V_match_object ${REPS}
bash ./runmulti.sh V_sample_R_integer ${REPS}
bash ./runmulti.sh V_sample_R_float ${REPS}
bash ./runmulti.sh V_sample_R_object ${REPS}
bash ./runmulti.sh V_sort_integer ${REPS}
bash ./runmulti.sh V_tabulate ${REPS}

bash ./runmulti.sh M_neutral_WF ${REPS}
bash ./runmulti.sh M_nonneutral_WF ${REPS}
bash ./runmulti.sh M_mut_fitness_1 ${REPS}
bash ./runmulti.sh M_mut_fitness_2 ${REPS}
bash ./runmulti.sh M_mut_tallies ${REPS}
bash ./runmulti.sh M_survival_1 ${REPS}
bash ./runmulti.sh M_survival_2 ${REPS}
bash ./runmulti.sh M_turnover_nonWF ${REPS}
bash ./runmulti.sh M_turnover_WF ${REPS}

bash ./runmulti.sh P_pointInBounds ${REPS}
bash ./runmulti.sh P_pointPeriodic ${REPS}
bash ./runmulti.sh P_pointReflected ${REPS}
bash ./runmulti.sh P_pointStopped ${REPS}
bash ./runmulti.sh P_pointUniform ${REPS}
bash ./runmulti.sh P_setSpatialPosition_1 ${REPS}
bash ./runmulti.sh P_setSpatialPosition_2 ${REPS}
bash ./runmulti.sh P_spatialMapValue ${REPS}

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

bash ./runmulti.sh S_drawByStrength_1D ${REPS}
bash ./runmulti.sh S_drawByStrength_2D ${REPS}
bash ./runmulti.sh S_drawByStrength_3D ${REPS}
bash ./runmulti.sh S_nearestInteractingNeighbors_1D ${REPS}
bash ./runmulti.sh S_nearestInteractingNeighbors_2D ${REPS}
bash ./runmulti.sh S_nearestInteractingNeighbors_3D ${REPS}
bash ./runmulti.sh S_nearestNeighbors_1D ${REPS}
bash ./runmulti.sh S_nearestNeighbors_2D ${REPS}
bash ./runmulti.sh S_nearestNeighbors_3D ${REPS}
bash ./runmulti.sh S_totalOfNeighborStrengths_1D ${REPS}
bash ./runmulti.sh S_totalOfNeighborStrengths_2D ${REPS}
bash ./runmulti.sh S_totalOfNeighborStrengths_3D ${REPS}

bash ./runmulti.sh T_treeseq_edges ${REPS}
bash ./runmulti.sh T_treeseq_simplify ${REPS}

#bash ./runmulti.sh Z_runner_test ${REPS}


