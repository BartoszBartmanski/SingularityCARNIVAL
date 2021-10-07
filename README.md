
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
singularity pull library://bartosz_bartmanski/default/carnival:2.2.0
```

## Usage

To run the example script that uses lpSolve contained in `/example/` directory
within the container, execute the following: 
```
./carnival_2.2.0.sif
```
which will produce `example_output.Rds` amongst other intermediate files.

To use [CPLEX](https://www.ibm.com/analytics/cplex-optimizer) ILP solver
```
singularity exec -B <cplex_dir>:<cplex_dir>,./:/data/ carnival_2.2.0.sif /example/other_solvers.R cplex <cplex_dir>/cplex /data/cplex_example.Rds
```
where `<cplex_dir>` is the cplex installation path e.g.
`/opt/ibm/ILOG/CPLEX_Studio201/cplex/bin/x86-64_linux/cplex`.

To use [Gurobi](https://www.gurobi.com/) ILP solver:
```
singularity exec -B <gurobi_dir>:<gurobi_dir>,./:/data/ --env "LD_LIBRARY_PATH=<gurobi_dir>/lib" carnival_2.2.0.sif /example/other_solvers.R gurobi <gurobi_dir>/bin/gurobi_cl /data/gurobi_example.Rds
```
where `<gurobi_dir>` is the gurobi installation path e.g.
`/opt/gurobi911/linux64/`


## Build

To create a new image:
```
sudo singularity build carnival_<version>.sif carnival.def
```
For example:
```
sudo singularity build carnival_2.2.0.sif carnival.def
```
