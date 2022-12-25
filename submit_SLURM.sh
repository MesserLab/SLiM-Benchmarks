#!/bin/bash -l

# This script submits a benchmarking job to Cornell's BSCB cluster, which uses
# SLURM for scheduling.  We limit ourselves to machines with these specs, for
# consistency/reproducibility:
#
#	4x Intel Xeon E5 4620 2.20GHz (32 physical cores, 64 hyperthreaded cores)
#	256GB RAM minimum
#
# The script is set up to monopolize the machine it gets, for more accurate
# benchmarking results; this means many cores will be underutilized.  That's life.
# Note that on this cluster "slots" are virtual (hyperthreaded) cores, so this
# script requests 64 "tasks" giving us 32 physical cores.
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
#SBATCH --ntasks=64
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

bash ./submit_TASKS.sh

