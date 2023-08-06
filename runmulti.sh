#!/bin/bash

# Run one model for a given number of replicates, across multiple (hard-coded) thread counts
#
# bash ./runmulti.sh <model-name> <replicates>
#
# Benjamin C. Haller, 13 July 2020
#
# see _README.txt for documentation
#

usage()
{
    echo "usage: bash ./runmulti.sh <model-name> <replicates>"
    exit 1
}

intregex='^[1-9][0-9]*$'


# Validate user input

modelname=$1
replicates=$2

if [ -z "${modelname}" ] ; then
    echo "ERROR: A model name must be supplied."
    usage
fi
if [ -z "${replicates}" ] ; then
    echo "ERROR: A replicate count must be supplied."
    usage
fi
if ! [[ "${replicates}" =~ ${intregex} ]] ; then
    echo "ERROR: The replicate count must be a positive integer."
    usage
fi


# Determine the list of threadcounts to run for; we use the variable SLIM_BENCHTHREADS,
# and default to threadcounts of 1 2 4 6 8 if that variable is not defined
if [ -z ${SLIM_BENCHTHREADS+x} ]; then
    #echo "SLIM_BENCHTHREADS is unset"
    SLIM_BENCHTHREADS="1 2 4 6 8"
fi


# Sublaunch runone.sh to do each set of replicates; thread count of 0 runs slim_original
# NOTE: running slim_original is disabled at this time, was not seeming useful
bash ./runone.sh ${modelname} ${replicates}

#bash ./runone.sh ${modelname} ${replicates} 0

for threadcount in ${SLIM_BENCHTHREADS} ; do
    bash ./runone.sh ${modelname} ${replicates} ${threadcount}
done















