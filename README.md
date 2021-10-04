
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
singularity pull library://bartosz_bartmanski/default/carnival:latest
```

## Usage

To run the example contained in `/scripts/` directory within the container,
execute the following: 
```
./carnival_2.2.0.sif
```
which will produce `example_output.Rds` amongst other intermediate files.

## Build

To create a new image:
```
sudo singularity build carnival_<version>.sif carnival.def
```
For example:
```
sudo singularity build carnival_latest.sif carnival.def
```
