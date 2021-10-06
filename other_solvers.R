#!/usr/bin/env Rscript

library(CARNIVAL)

args <- commandArgs(trailingOnly=TRUE)

load(file = system.file("toy_inputs_ex1.RData", package="CARNIVAL"))
load(file = system.file("toy_measurements_ex1.RData", package="CARNIVAL"))
load(file = system.file("toy_network_ex1.RData", package="CARNIVAL"))

# path_to_cplex <- system("which cplex", intern=TRUE)
if (length(args) < 3) {
    print("Need to specify solver, path to solver and output path")
    stop(1)
}
solver <- args[1]
path_to_solver <- args[2]
output_path <- args[3]

print(args)

result = runCARNIVAL(solver = solver,
                     solverPath = path_to_solver,
                     inputObj = toy_inputs_ex1,
                     measObj = toy_measurements_ex1,
                     netObj = toy_network_ex1,
                     dir_name = dirname(output_path))
print(result)

saveRDS(result, output_path)
