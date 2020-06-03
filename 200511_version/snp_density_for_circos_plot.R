# 3 June 2020
# On the command line, you must type "module load R" and then "R" again to get R to work on the MSI servers.
# working directory is: /home/jkimball/haasx092/pilot_GBS

# Load required packages
library(data.table)
library(reshape2)

# This section  allows for filenames to be specified in the shell script that launches this R script.
# By doing it this way, this script can be reused multiple times without making a new copy for each input file.
args = commandArgs(trailingOnly = TRUE)
input_filename = args[1]
output_filename = args[2]

# Read in the data, give column names, and remove a unnecessary/empty column
fread(input_filename) -> x
setnames(x, c("scaffold", "position", "ref", "alt", "quality", "sample", "GT", "V8", "DP", "DV"))
x[, V8 := NULL]

# Filter for low quality scores (minimum=40)
x[quality > 40] -> y
# Filter for a minimum depth of 50 reads
y[DP > 6] -> y

# Clean up sample names by stripping the "relative path" style, leaving only the sample name.
# The sample names will be turned into column names for part of the analysis, so this will make it cleaner.
y[, sample := sub("/.+$", "", sample)]

# Do the same for the scaffold names
y[, scaffold := sub(";.+$", "", scaffold)]

# Calculate DV/DP ratio and round to two digits
#y[, ratio := signif(DV/DP, digits=2)]

# Name scaffolds of interest
scaffolds_of_interest = c("Scaffold_1", "Scaffold_3", "Scaffold_7", "Scaffold_9", "Scaffold_13", "Scaffold_18", "Scaffold_48", "Scaffold_51", "Scaffold_70", "Scaffold_93", "Scaffold_415", "Scaffold_693", "Scaffold_1062", "Scaffold_1063", "Scaffold_1064", "Scaffold_1065")
# Retain only scaffolds of interest
y[scaffold %in% scaffolds_of_interest] -> y

dcast(y, scaffold + position + ref + alt ~ sample, value.var="GT") -> z
z <- as.data.table(z)
# Count number of NA values (missing individuals) per SNP
z[, sum := apply(z, MARGIN = 1, function(x) sum(is.na(x)))]
# Filter based on the number of NA values
z[sum <= 2] -> a

z <- a[, .(scaffold, position)]

# Find SNP density (almost identical to how retrotransposon density was found)
lapply(c(1,3,7,9,13,18,48,51,70,93,415,693,1062,1063,1064,1065), function (i) {
z[scaffold == paste0("Scaffold_", i), .N, key=.(bin=position %/% 1000000 * 1000000)] -> snps

snps[, start := bin]
snps[, end := start + 1000000]
options(scipen = 999) # Gets rid of scientific notation

setcolorder(snps, c("start", "end", "N", "bin"))
snps[, bin := NULL]
}) -> snps_binned

# Make a chr column and assign appropriate "zp" number
for (i in c(1:16)) {
snps_binned[[i]][, chr := paste0("zp", i)]
setcolorder(snps_binned[[i]], c("chr", "start", "end", "N"))
}

# Name each item in the list
names(snps_binned) <- c("scf1", "scf3", "scf7", "scf9", "scf13", "scf18", "scf48", "scf51", "scf70", "scf93", "scf415", "scf693", "scf1062", "scf1063", "scf1064", "scf1065")

# Write each item to a separate text file
for (i in c(1:16)) {
write.table(snps_binned[[i]], file = paste0("scf", i, "_snp_density"), sep = " ", quote = FALSE, col.names = FALSE, row.names = FALSE)
}

# Save
save(snps_binned, file = output_filename)