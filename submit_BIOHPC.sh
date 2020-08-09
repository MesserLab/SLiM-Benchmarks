#!/bin/bash -l

# This script submits a benchmarking job to Cornell's BioHPC cluster, which
# does not use a scheduler (you reserve a whole node).  The target machine is:
#
#	two 20-core (40-hyperthreaded) Intel Xeon Gold 6148 2.4GHz
#	total 40 physical cores, 80 virtual cores (cbsulm21-22,27-28)
#
# The script is set up to monopolize the machine it gets, for more accurate
# benchmarking results; this means many cores will be underutilized.  That's life.
#
# Submit this job with: nohup bash ./submit_BIOHPC.sh >& hpclog.txt &
#
# See https://biohpc.cornell.edu/lab/lab.aspx for more info on this
# cluster.  Of course your cluster will be different in various respects; this
# script is just an example.

#
# Benjamin C. Haller, 8 August 2020

SLIM_BENCHTHREADS="1 2 5 10 20 40 60 80"
export SLIM_BENCHTHREADS

# run all models
#bash ./runall.sh 5

# run specified models
#bash ./runmulti.sh neutral_WF 5
#bash ./runmulti.sh nonneutral_WF 5
bash ./runmulti.sh T_CalculateAllDistances1D 5
bash ./runmulti.sh T_CalculateAllDistances2D 5
bash ./runmulti.sh T_CalculateAllDistances3D 5
bash ./runmulti.sh T_CalculateAllStrengths1D 5
bash ./runmulti.sh T_CalculateAllStrengths2D 5
bash ./runmulti.sh T_CalculateAllStrengths3D 5
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

# give the reserved node back to the cluster; replace the reservation # here
/programs/bin/labutils/endres.pl 119124

