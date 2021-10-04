
SHELL := /bin/bash

cplex_path := $(dir $(shell which cplex))

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

.PHONY: run_example_cplex
run_example_cplex:
	singularity exec -B ${cplex_path}:${cplex_path} carnival_2.2.0.sif /example/example_cplex.R ${cplex_path}/cplex

.git/hooks/pre-push:
	ln -s ../../.pre-push $@

.PHONY: clean_example
clean_example:
	rm -f *.RData *.lp *.h5 *.dot *.Rds *.txt

clean: clean_example
	rm -rf *.sif

