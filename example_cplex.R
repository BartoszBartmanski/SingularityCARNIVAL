#!/usr/bin/env Rscript

library(CARNIVAL)

args <- commandArgs(trailingOnly=TRUE)

load(file = system.file("toy_inputs_ex1.RData", package="CARNIVAL"))
load(file = system.file("toy_measurements_ex1.RData", package="CARNIVAL"))
load(file = system.file("toy_network_ex1.RData", package="CARNIVAL"))

# path_to_cplex <- system("which cplex", intern=TRUE)
if (length(args) < 1) {
    print("Need to specify path to CPLEX")
    stop(1)
}
path_to_cplex <- args[1]
output_dir <- "./"

print(length(args))
print(args)
print(path_to_cplex)

result = runCARNIVAL(solver = "cplex",
                     solverPath = path_to_cplex,
                     inputObj = toy_inputs_ex1,
                     measObj = toy_measurements_ex1,
                     netObj = toy_network_ex1,
                     dir_name=output_dir)
print(result)

saveRDS(result, paste0(output_dir, "/example_result.Rds"))
