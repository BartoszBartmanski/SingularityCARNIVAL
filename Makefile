
all: carnival_2.2.0.sif

carnival_%.sif: carnival.def
	sudo singularity build $@ $^
	singularity sign $@

.PHONY: push_%
push_%: carnival_%.sif
	singularity push $^ library://bartosz_bartmanski/default/carnival:$*

.git/hooks/pre-push:
	ln -s ../../.pre-push $@

clean:
	rm -rf *.sif

