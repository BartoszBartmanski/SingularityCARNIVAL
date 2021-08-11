
all: carnival_latest.sif

carnival_%.sif: carnival.def
	sudo singularity build $@ $^
	singularity sign $@

.PHONY: push_%
push_%:
	singularity push carnival_$*.sif library://bartosz_bartmanski/default/carnival:$*

clean:
	rm -rf */*.sif

