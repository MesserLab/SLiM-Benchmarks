SLiM-Benchmarks
================

Benjamin C. Haller
12 August 2023


The purpose of this repository is to provide models that are useful for benchmarking SLiM, particularly with an eye toward hotspots in the code that may be amenable to parallelizing.  These models are not intended to be recipes or useful real-world models; they are designed to exercise particular parts of the code.  They are also not intended to be tests, and the results from them are not checked or validated more than minimally; testing of SLiM is done in other ways.

The amount of speedup observed will generally depend upon the size of the task being broken up across multiple threads.  A small task may actually perform worse with multithreading, because the fixed overhead of starting up a thread group to handle the task costs more in performance than it saves.  A very large task will usually benefit, unless the nature of the task is such that it really can't be multithreaded effectively (because each unit of work is not independent of the results of the other units of work, for example).  The benchmarks here do not try to evaluate the threshold at which multithreading becomes effective.  Instead, they are constructed to be very large, so as to evaluate the *maximum* speedup that one would expect on a given platform for a given task.  The threshold task size at which a multithreaded build of SLiM will go parallel, for a given task, will be determined in some other way (to be determined); right now it is just estimated by gut.

Since SLiM models are stochastic, the random number sequence matters.  With the single-threaded version of SLiM, using the same seed can reproduce a given run.  However, a change to the internals of SLiM can change the result of a model even given a fixed random number seed, and the difference can be large (since, once a simulation has diverged at all, the final result may be completely different due to chaos theory).  This means that a run of a model with a given seed might go quickly with one version of the code but more slowly with a different version of the code, even if the true speed of the code actually did not change at all, because, for example, coalescence occurred earlier in one run than in the other run, decreasing the density of mutations in the genomes of the population.

Additionally, because parallelizing computations can change the result slightly (due to roundoff and other numerical error, for example), running the same model with the same seed when parallel can produce different results.  Again, even a tiny numerical error in the calculation of, say, a fitness value can lead a model down a completely different path due to chaos theory.  Parallel runs of SLiM are therefore, in the general case, not reproducible even with the same random number seed and the same SLiM executable.

For these reasons, a single run of one of these tests should not be taken to be representative or even reproducible.  Instead, a fairly large number of replicates should be run with different seeds, and the performance of the test should be averaged across those replicates.  Of course, some of the tests will exhibit more variance between runs than others.


Repository Contents
===================

slim_original: the SLiM 4.0.1 executable, for comparison to the state of things prior to all work on parallelization and vectorization.  This is not provided in GitHub, since executable binaries are platform-specific.

slim_single: a SLiM executable built single-threaded, without linking to OpenMP at all.  This is the base case for performance comparison.  This is not provided in GitHub, since executable binaries are platform-specific.

slim_multi: a SLiM executable built multi-threaded, linking against OpenMP.  Even when a thread count of 1 is specified at the command line, this is fundamentally different from single-threaded SLiM and will exhibit different performance characteristics.  This is not provided in GitHub, since executable binaries are platform-specific.

runone.sh, runmulti.sh, runall.sh: scripts that execute benchmark(s); see documentation below.

submit_SLURM.sh: a job submission script tailored for Cornell's BSCB cluster; see its header for details.  Timing results may be confounded by the work being done by other processes in the cluster, so this script is not recommended.

submit_BIOHPC.sh: a job submission script tailored for a single machine on Cornell's BioHPC cluster; see its header for details.

submit_MACBOOK.sh: a job submission script tailored for my MacBook; see its header for details.

submit_MACSTUDIO.sh: a job submission script tailored for my MacBook; see its header for details.

The "models" directory contains the models for the benchmarks.  Each model has a comment at the top describing what part of the code it is intended to exercise.  Model filenames start with a prefix that indicates the type of the test; this just sorts the tests into related groups.

The Z_runner_test.slim file is a trivial model that takes virtually no time, used for testing the runner scripts; in GitHub it is in a folder named "models (disabled)", so if you want to use it you should move it into the "models" folder.

The "profiles" directory contains profiles from Instruments (part of Xcode) of the models running single-threaded, showing which part of the SLiM code base they focus on.  These profiles are filtered with a 100-sample minimum, to get rid of extraneous noise and focus on the bottlenecks.  These have not been updated in a long time.

The "times_single" directory contains runtime data for each replicate of each model run with the slim_single single-threaded version of SLiM, produced by the runner scripts.  Actually each results file is a CSV file with five columns: (1) the CPU time used in seconds, (2) the elapsed wall clock time in seconds, (3) a self-measured benchmark time used by some tests to isolate the relevant portion of the run; (4) the memory usage in MB; and (5) a summary string generated by the test, typically indicating whether a discrepancy was seen.  Each replicate gets a separate row.  The benchmark time is the best metric, if it is available; if not, elapsed wall time is generally the relevant quantity, not the CPU time.  The goal of parallelization is to spread the same work across multiple cores to achieve a shorter wall clock time, even if the total CPU time used may be (and generally is) higher.

The "times_original" directories contain runtime data for the corresponding parallel runs of each model with the slim_original (i.e., SLiM 4.0.1) executable, produced by the runner scripts.  The CSV file format is the same as for times_single.

The "times_parallel_X" directories contain runtime data for the corresponding parallel runs of each model with X threads using the slim_multi executable, produced by the runner scripts.  The CSV file format is the same as for times_single.

The timing properties on a different platforms, such as laptops vs. computing clusters, may be very different, so you should not rely on any timing data provided here to inform your choices about how to run SLiM for the best performance.  If you want to generate timing data for a given platform, clear out all the times_X folders and run the benchmarks with the runner scripts yourself.


Running timing tests
====================

To run a single model for a single thread count and save timing data into the timing folders, cd to the SLiM-Benchmarks folder at its top level, and then use the runone.sh script:

    bash ./runone.sh <model-name> <replicates> [<thread-count>]

The <model-name> should not have any file extension; e.g., "turnover_WF".  The <replicates> should be a positive integer.  The <thread_count> should be a positive integer or omitted; if it is omitted, slim_single will be run and the results will go into times_single, whereas if it is supplied as any positive integer X, slim_multi will be run, a thread-count of X will be passed to SLiM, and results will go into times_parallel_X.  If it is supplied but 0, slim_original will be run.


To run a single model across a standard set of thread counts, use the runmulti.sh script:

    bash ./runmulti.sh <model-name> <replicates>

This passes the model name and replicate count through to runone.sh, sublaunching it multiple times to generate replicates for the single-thread case as well as for specific thread counts for the multi-threaded case.  The thread counts used for the multi-threaded case are governed by the shell variable SLIM_BENCHTHREADS.  By default this variable is set with SLIM_BENCHTHREADS="1 2 4 6 8" for now; this choice for the number of threads is tailored to our target testing machine and will change.  You can change the thread counts used by simply setting and exporting the variable, like so:

    SLIM_BENCHTHREADS="1 2 5 10 20 40"
    export SLIM_BENCHTHREADS

Then those thread counts will be used for subsequent invocations of the runner scripts.


To execute bulk runs, use the runall.sh script:

    bash ./runall.sh <replicates>

The only parameter here is the number of replicates desired.  This script will loop over all of the models found in the models folder (*.slim), and will run each of them across replicates and thread counts by calling runmulti.sh and passing the requested replicate count through.

Alternatively, to execute bulk runs, use one of the submission scripts: submit_BIOHPC.sh, submit_MACBOOK.sh, submit_MACSTUDIO.sh, or submit_SLURM.sh.  These will run all of the tests that are not commented out with a "#" in the script.  This is an easy way to exercise precise control over which tests are run.


Note that these scripts never run more than one invocation of SLiM at a time, to keep the machine free from contention for resources (to the extent possible, other apps/processes should be quit, for the same reason).  These runtimes are therefore, roughly, the *minimum* runtime expected, and when running multiple invocations simultaneously on a single machine, one would expect somewhat lower performance due to resource contention.  How large that effect is will depend upon the platform and the specific model being run, as well as exactly what else the machine is doing with its other cores.

