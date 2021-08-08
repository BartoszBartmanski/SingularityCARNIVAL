
IMAGES := $(patsubst %.def,%.sif,$(wildcard */image.def))

all: ${IMAGES}

%.sif: %.def
	cd $(dir $@) && sudo singularity build $(notdir $@) $(notdir $^)
	singularity sign $@

.PHONY: push_%
push_%:
	singularity push $*/image.sif library://bartosz_bartmanski/default/carnival:$*

.git/hooks/pre-push:
	ln -s ../../.pre-push $@

clean:
	rm -rf */*.sif

