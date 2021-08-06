
all: 2.2.0/image.sif

%.sif: %.def
	cd $(dir $@) && sudo singularity build $(notdir $@) $(notdir $^)

.PHONY: push_%
push_%:
	singularity push $*/image.sif library://bartosz_bartmanski/default/carnival:$*

clean:
	rm -rf */*.sif

