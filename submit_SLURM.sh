#!/bin/bash -l

# This script submits a benchmarking job to Cornell's BSCB cluster, which uses
# SLURM for scheduling.  We limit ourselves to machines with these specs, for
# consistency/reproducibility:
#
#	4x Intel Xeon E5 4620 2.20GHz (32 regular cores, 64 hyperthreaded cores)
#	256GB RAM minimum
#
# The script is set up to monopolize the machine it gets, for more accurate
# benchmarking results; this means many cores will be underutilized.  That's life.
#
# Submit this job with: sbatch submit_SLURM.sh (from the SLiM-Benchmarks folder).
#
# See https://biohpc.cornell.edu/lab/cbsubscb_SLURM.htm for more info on this
# cluster.  Of course your cluster will be different in various respects; this
# script is just an example.

#
# Benjamin C. Haller, 19 July 2020

#SBATCH --nodes=1
#SBATCH --exclude=cbsubscb08,cbsubscb09,cbsubscb10,cbsubscb11,cbsubscb12,cbsubscb13,cbsubscb14,cbsubscb15,cbsubscbgpu01
#SBATCH --ntasks=32
#SBATCH --mem=256000
#SBATCH --time=1-0:00:00
#SBATCH --partition=regular
#SBATCH --account=bscb10
#SBATCH --job-name=SLiM-Benchmark
#SBATCH --output=slimbench.out.%j
#SBATCH --mail-user=bch59@cornell.edu
#SBATCH --mail-type=ALL

SLIM_BENCHTHREADS="1 2 3 4 8 16 32 48 64"
export SLIM_BENCHTHREADS

# run all models
#bash ./runall.sh 5

# run specified models
#bash ./runmulti.sh neutral_WF 5#bash ./runmulti.sh nonneutral_WF 5bash ./runmulti.sh T_CalculateAllDistances1D 5bash ./runmulti.sh T_CalculateAllDistances2D 5bash ./runmulti.sh T_CalculateAllDistances3D 5bash ./runmulti.sh T_CalculateAllStrengths1D 5bash ./runmulti.sh T_CalculateAllStrengths2D 5bash ./runmulti.sh T_CalculateAllStrengths3D 5bash ./runmulti.sh T_set_fitnessScaling_1 5bash ./runmulti.sh T_set_fitnessScaling_2 5bash ./runmulti.sh T_sum_float 5bash ./runmulti.sh T_sum_integer 5bash ./runmulti.sh T_sum_logical 5bash ./runmulti.sh T_sumOfMutationsOfType 5#bash ./runmulti.sh treeseq_edges 5#bash ./runmulti.sh treeseq_simplify 5#bash ./runmulti.sh turnover_nonWF 5#bash ./runmulti.sh turnover_WF 5
