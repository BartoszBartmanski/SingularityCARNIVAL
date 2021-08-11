
# SingularityCARNIVAL

Repository for [CARNIVAL](https://github.com/saezlab/CARNIVAL/)
singularity images based on Ubuntu 20.04. 

## Build

To create a new image:
```
sudo singularity build carnival_<version>.sif carnival.def
```
For example:
```
sudo singularity build carnival_latest.sif carnival.def
```

## Download

To download an image from sylabs library:
```
singularity pull library://bartosz_bartmanski/default/carnival:<version>
```
For example:
```
singularity pull library://bartosz_bartmanski/default/carnival:latest
```

