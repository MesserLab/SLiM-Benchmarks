#!/bin/bash -l

# This script submits a standard set of tasks for a benchmarking job.
#
# Do not run this directly; use the other submit_* scripts.

#
# Benjamin C. Haller, 8 August 2020

#SLIM_BENCHTHREADS is assumed to be defined externally

REPS=5

# run all models
#bash ./runall.sh ${REPS}

# run specified models
#bash ./runmulti.sh C_CONTAINS_MARKER_MUT ${REPS}
#bash ./runmulti.sh C_G_COUNT_OF_MUTS_OF_TYPE ${REPS}
#bash ./runmulti.sh C_I_COUNT_OF_MUTS_OF_TYPE ${REPS}
#bash ./runmulti.sh C_INDS_W_PEDIGREE_IDS_misses ${REPS}
#bash ./runmulti.sh C_INDS_W_PEDIGREE_IDS ${REPS}
#bash ./runmulti.sh C_RELATEDNESS ${REPS}
#bash ./runmulti.sh C_SAMPLE_INDIVIDUALS_1 ${REPS}
#bash ./runmulti.sh C_SAMPLE_INDIVIDUALS_2 ${REPS}
#bash ./runmulti.sh C_SET_FITNESS_SCALE_1 ${REPS}
#bash ./runmulti.sh C_SET_FITNESS_SCALE_2 ${REPS}
#bash ./runmulti.sh C_SUM_OF_MUTS_OF_TYPE ${REPS}

#bash ./runmulti.sh D_CLIPPEDINTEGRAL_1S ${REPS}
#bash ./runmulti.sh D_CLIPPEDINTEGRAL_2S ${REPS}
#bash ./runmulti.sh D_INTNEIGHCOUNT_1d ${REPS}
#bash ./runmulti.sh D_INTNEIGHCOUNT ${REPS}
#bash ./runmulti.sh D_INTNEIGHCOUNT_3d ${REPS}
#bash ./runmulti.sh D_LOCALPOPDENSITY_1d ${REPS}
#bash ./runmulti.sh D_LOCALPOPDENSITY ${REPS}
#bash ./runmulti.sh D_NEIGHCOUNT_1d ${REPS}
#bash ./runmulti.sh D_NEIGHCOUNT ${REPS}
#bash ./runmulti.sh D_NEIGHCOUNT_3d ${REPS}

#bash ./runmulti.sh E_ABS_FLOAT ${REPS}
#bash ./runmulti.sh E_CEIL ${REPS}
#bash ./runmulti.sh E_EXP_FLOAT ${REPS}
#bash ./runmulti.sh E_FLOOR ${REPS}
#bash ./runmulti.sh E_LOG_FLOAT ${REPS}
#bash ./runmulti.sh E_LOG10_FLOAT ${REPS}
#bash ./runmulti.sh E_LOG2_FLOAT ${REPS}
#bash ./runmulti.sh E_ROUND ${REPS}
#bash ./runmulti.sh E_SQRT_FLOAT ${REPS}
#bash ./runmulti.sh E_SUM_FLOAT ${REPS}
#bash ./runmulti.sh E_SUM_INTEGER ${REPS}
#bash ./runmulti.sh E_SUM_LOGICAL ${REPS}
#bash ./runmulti.sh E_TRUNC ${REPS}

#bash ./runmulti.sh I_AGE_INCR ${REPS}
#bash ./runmulti.sh I_DEFERRED_REPRO ${REPS}
#bash ./runmulti.sh I_FITNESS_ASEX_1 ${REPS}
#bash ./runmulti.sh I_FITNESS_ASEX_2 ${REPS}
#bash ./runmulti.sh I_FITNESS_ASEX_3 ${REPS}
#bash ./runmulti.sh I_FITNESS_SEX_1 ${REPS}
#bash ./runmulti.sh I_FITNESS_SEX_2 ${REPS}
#bash ./runmulti.sh I_FITNESS_SEX_3 ${REPS}
#bash ./runmulti.sh I_MIGRANT_CLEAR ${REPS}
#bash ./runmulti.sh I_MUT_FREE ${REPS}
#bash ./runmulti.sh I_MUT_TALLY ${REPS}
#bash ./runmulti.sh I_MUTRUN_FREE ${REPS}
#bash ./runmulti.sh I_PARENTS_CLEAR ${REPS}
#bash ./runmulti.sh I_SIMPLIFY_CORE ${REPS}
#bash ./runmulti.sh I_SIMPLIFY_SORT ${REPS}
#bash ./runmulti.sh I_SURVIVAL ${REPS}
#bash ./runmulti.sh I_UNIQUE_MUTRUNS ${REPS}
#bash ./runmulti.sh I_WF_REPRO ${REPS}

#bash ./runmulti.sh M_neutral_WF ${REPS}
#bash ./runmulti.sh M_nonneutral_WF ${REPS}
#bash ./runmulti.sh M_treeseq_edges ${REPS}
#bash ./runmulti.sh M_turnover_nonWF ${REPS}
#bash ./runmulti.sh M_turnover_WF ${REPS}

#bash ./runmulti.sh P_POINT_IN_BOUNDS_1D ${REPS}
#bash ./runmulti.sh P_POINT_IN_BOUNDS_2D ${REPS}
#bash ./runmulti.sh P_POINT_IN_BOUNDS_3D ${REPS}
#bash ./runmulti.sh P_POINT_PERIODIC_1D ${REPS}
#bash ./runmulti.sh P_POINT_PERIODIC_2D ${REPS}
#bash ./runmulti.sh P_POINT_PERIODIC_3D ${REPS}
#bash ./runmulti.sh P_POINT_REFLECTED_1D ${REPS}
#bash ./runmulti.sh P_POINT_REFLECTED_2D ${REPS}
#bash ./runmulti.sh P_POINT_REFLECTED_3D ${REPS}
#bash ./runmulti.sh P_POINT_STOPPED_1D ${REPS}
#bash ./runmulti.sh P_POINT_STOPPED_2D ${REPS}
#bash ./runmulti.sh P_POINT_STOPPED_3D ${REPS}
#bash ./runmulti.sh P_POINT_UNIFORM_1D ${REPS}
#bash ./runmulti.sh P_POINT_UNIFORM_2D ${REPS}
#bash ./runmulti.sh P_POINT_UNIFORM_3D ${REPS}
#bash ./runmulti.sh P_SET_SPATIAL_POS_1_1D ${REPS}
#bash ./runmulti.sh P_SET_SPATIAL_POS_1_2D ${REPS}
#bash ./runmulti.sh P_SET_SPATIAL_POS_1_3D ${REPS}
#bash ./runmulti.sh P_SET_SPATIAL_POS_2_1D ${REPS}
#bash ./runmulti.sh P_SET_SPATIAL_POS_2_2D ${REPS}
#bash ./runmulti.sh P_SET_SPATIAL_POS_2_3D ${REPS}
#bash ./runmulti.sh P_SPATIAL_MAP_VALUE ${REPS}

bash ./runmulti.sh Q_SORT_INTEGER ${REPS}
bash ./runmulti.sh Q_SORT_FLOAT ${REPS}
bash ./runmulti.sh Q_SORT_STRING ${REPS}

#bash ./runmulti.sh R_DNORM_1 ${REPS}
#bash ./runmulti.sh R_DNORM_2 ${REPS}
#bash ./runmulti.sh R_RBINOM_1 ${REPS}
#bash ./runmulti.sh R_RBINOM_2 ${REPS}
#bash ./runmulti.sh R_RBINOM_3 ${REPS}
#bash ./runmulti.sh R_RDUNIF_1 ${REPS}
#bash ./runmulti.sh R_RDUNIF_2 ${REPS}
#bash ./runmulti.sh R_RDUNIF_3 ${REPS}
#bash ./runmulti.sh R_REXP_1 ${REPS}
#bash ./runmulti.sh R_REXP_2 ${REPS}
#bash ./runmulti.sh R_RNORM_1 ${REPS}
#bash ./runmulti.sh R_RNORM_2 ${REPS}
#bash ./runmulti.sh R_RNORM_3 ${REPS}
#bash ./runmulti.sh R_RPOIS_1 ${REPS}
#bash ./runmulti.sh R_RPOIS_2 ${REPS}
#bash ./runmulti.sh R_RUNIF_1 ${REPS}
#bash ./runmulti.sh R_RUNIF_2 ${REPS}
#bash ./runmulti.sh R_RUNIF_3 ${REPS}

#bash ./runmulti.sh S_DRAWBYSTRENGTH_1d ${REPS}
#bash ./runmulti.sh S_DRAWBYSTRENGTH ${REPS}
#bash ./runmulti.sh S_DRAWBYSTRENGTH_3d ${REPS}
#bash ./runmulti.sh S_NEARESTINTNEIGH_1d ${REPS}
#bash ./runmulti.sh S_NEARESTINTNEIGH ${REPS}
#bash ./runmulti.sh S_NEARESTINTNEIGH_3d ${REPS}
#bash ./runmulti.sh S_NEARESTNEIGH_1d ${REPS}
#bash ./runmulti.sh S_NEARESTNEIGH ${REPS}
#bash ./runmulti.sh S_NEARESTNEIGH_3d ${REPS}
#bash ./runmulti.sh S_TOTNEIGHSTRENGTH_1d ${REPS}
#bash ./runmulti.sh S_TOTNEIGHSTRENGTH ${REPS}
#bash ./runmulti.sh S_TOTNEIGHSTRENGTH_3d ${REPS}

#bash ./runmulti.sh V_MATCH_INT ${REPS}
#bash ./runmulti.sh V_MATCH_FLOAT ${REPS}
#bash ./runmulti.sh V_MATCH_STRING ${REPS}
#bash ./runmulti.sh V_MATCH_OBJECT ${REPS}
#bash ./runmulti.sh V_SAMPLE_INDEX ${REPS}
#bash ./runmulti.sh V_SAMPLE_R_INT ${REPS}
#bash ./runmulti.sh V_SAMPLE_R_FLOAT ${REPS}
#bash ./runmulti.sh V_SAMPLE_R_OBJECT ${REPS}
#bash ./runmulti.sh V_SAMPLE_WR_INT ${REPS}
#bash ./runmulti.sh V_SAMPLE_WR_FLOAT ${REPS}
#bash ./runmulti.sh V_SAMPLE_WR_OBJECT ${REPS}
#bash ./runmulti.sh V_TABULATE_MAXBIN ${REPS}
#bash ./runmulti.sh V_TABULATE ${REPS}

#bash ./runmulti.sh X_MAX_INT ${REPS}
#bash ./runmulti.sh X_MAX_FLOAT ${REPS}
#bash ./runmulti.sh X_MIN_INT ${REPS}
#bash ./runmulti.sh X_MIN_FLOAT ${REPS}
#bash ./runmulti.sh X_PMAX_INT_1 ${REPS}
#bash ./runmulti.sh X_PMAX_INT_2 ${REPS}
#bash ./runmulti.sh X_PMAX_FLOAT_1 ${REPS}
#bash ./runmulti.sh X_PMAX_FLOAT_2 ${REPS}
#bash ./runmulti.sh X_PMIN_INT_1 ${REPS}
#bash ./runmulti.sh X_PMIN_INT_2 ${REPS}
#bash ./runmulti.sh X_PMIN_FLOAT_1 ${REPS}
#bash ./runmulti.sh X_PMIN_FLOAT_2 ${REPS}

#bash ./runmulti.sh Z_runner_test ${REPS}


