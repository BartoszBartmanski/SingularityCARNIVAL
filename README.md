
# CARNIVAL singularity images

Repository for [CARNIVAL](https://github.com/saezlab/CARNIVAL/)
singularity images based on Ubuntu 20.04. 

## Build

To create a new image:
```
cd <version>
sudo singularity build image.sif image.def
```
For example:
```
cd 2.2.0
sudo singularity build image.sif image.def
```

## Download

To download an image:
```
singularity pull library://bartosz_bartmanski/default/carnival:<version>
```
For example:
```
singularity pull library://bartosz_bartmanski/default/carnival:2.2.0
```

