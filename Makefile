
all: carnival_2.2.0.sif

carnival_%.sif: carnival.def
	sudo singularity build $@ $^
	singularity sign $@

.PHONY: push_%
push_%: carnival_%.sif
	singularity push $^ library://bartosz_bartmanski/default/carnival:$*

.git/hooks/pre-push:
	ln -s ../../.pre-push $@

.PHONY: clean_example
clean_example:
	rm -f *.RData *.lp *.h5 *.dot *.Rds

clean: clean_example
	rm -rf *.sif

