#!/usr/bin/env Rscript

library(CARNIVAL)
library(rhdf5)
library(rjson)


# Get command line input
args <- commandArgs(trailingOnly=TRUE)
input_path <- args[1]
output_path <- args[2]

perturbations <- unlist(h5read(input_path, "inputs"))
measurements <- unlist(h5read(input_path, "meas"))
pkn <- h5read(input_path, "PKN")
opts <- fromJSON(file = args[3])

# Run CARNIVAL
result <- runVanillaCarnival(perturbations = perturbations,
                             measurements = measurements,
                             priorKnowledgeNetwork = pkn,
                             weights = NULL,
                             carnivalOptions = opts)

# Save results
saveRDS(result, output_path)

