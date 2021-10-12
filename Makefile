
SHELL := /bin/bash

cplex_path := $(dir $(shell which cplex))
gurobi_path := $(patsubst %/linux64/bin/gurobi_cl,%,$(shell which gurobi_cl))

all: carnival_2.2.0.sif

carnival_%.sif: carnival.def
	sudo singularity build $@ $^
	singularity sign $@

.PHONY: push_%
push_%: carnival_%.sif
	singularity push $^ library://bartosz_bartmanski/default/carnival:$*

.PHONY: run_example_lp_solve
run_example_lp_solve:
	./carnival_2.2.0.sif

cplex_example.Rds:
	singularity exec -B ${cplex_path}:${cplex_path},./:/data/ carnival_2.2.0.sif /example/other_solvers.R cplex ${cplex_path}/cplex /data/$@

gurobi_example.Rds:
	singularity exec -B ${gurobi_path}:${gurobi_path},./:/data/ --env "LD_LIBRARY_PATH=${gurobi_path}/linux64/lib" carnival_2.2.0.sif /example/other_solvers.R gurobi ${gurobi_path}/linux64/bin/gurobi_cl /data/$@

.git/hooks/pre-push:
	ln -s ../../.pre-push $@

.PHONY: clean_example
clean_example:
	rm -f *.RData *.lp *.h5 *.dot *.Rds *.txt *.sol *.log

clean: clean_example
	rm -rf *.sif

