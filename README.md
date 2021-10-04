
# SingularityCARNIVAL

Repository for [CARNIVAL](https://github.com/saezlab/CARNIVAL/)
singularity images based on Ubuntu 20.04. 

## Download

To download an image from sylabs library:
```
singularity pull library://bartosz_bartmanski/default/carnival:<version>
```
For example:
```
singularity pull library://bartosz_bartmanski/default/carnival:latest
```

## Usage

To run the example script that uses lpSolve contained in `/example/` directory
within the container, execute the following: 
```
./carnival_2.2.0.sif
```
which will produce `example_output.Rds` amongst other intermediate files.

To use another ILP solver, e.g. CPLEX, run the following:
```
singularity exec -B <cplex_dir>:<cplex_dir> carnival_2.2.0.sif /example/example_cplex.R <path_to_cplex>
```
For example, assuming CPLEX is intalled in 
`/opt/ibm/ILOG/CPLEX_Studio201/cplex/bin/x86-64_linux/cplex`:
```
singularity exec -B /opt/:/opt/ carnival_2.2.0.sif /example/example_cplex.R /opt/ibm/ILOG/CPLEX_Studio201/cplex/bin/x86-64_linux/cplex
```

## Build

To create a new image:
```
sudo singularity build carnival_<version>.sif carnival.def
```
For example:
```
sudo singularity build carnival_latest.sif carnival.def
```
