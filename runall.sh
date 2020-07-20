#!/bin/bash

# Run all models for a given number of replicates, single-threaded and for a hard-coded set of thread counts
#
# bash ./runall.sh <replicates>
#
# Benjamin C. Haller, 13 July 2020
#
# see _README.txt for documentation
#

usage()
{
    echo "usage: bash ./runall.sh <replicates>"
    exit 1
}

intregex='^[1-9][0-9]*$'
modelregex='^.*/([a-zA-Z_0-9.]+)\.slim$'


# Validate user input

replicates=$1

if [ -z "${replicates}" ] ; then
    echo "ERROR: A replicate count must be supplied."
    usage
fi
if ! [[ "${replicates}" =~ ${intregex} ]] ; then
    echo "ERROR: The replicate count must be a positive integer."
    usage
fi


# Sublaunch runmulti.sh to do each set of replicates across the desired thread counts
for modelpath in ./models/*.slim ; do
    [[ ${modelpath} =~ ${modelregex} ]] && modelname=${BASH_REMATCH[1]}
    #echo "modelpath == ${modelpath}, modelname == ${modelname}"
    
    bash ./runmulti.sh ${modelname} ${replicates}
done















