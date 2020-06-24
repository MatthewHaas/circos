# 12 June 2020

# Set working directory
setwd("~/Documents/wild_rice")

# Load required packages
library(data.table)

# Read in data
x <- fread("duplications_with_positions.csv")

# Remove unnecessary columns
x[, V1 := NULL]
x[, gene_1 := NULL]
x[, gene_2 := NULL]

# Replace the scaffold names in column "scaffold_1" with their zp numbers
# This is to make it fuction with circos... And I realize the column name "scaffold_1"
# might be confusing given that there are values in the column of "Scaffold_1" ...sorrry...
x[, scaffold_1 := sub("^Scaffold_1$", "zp1", scaffold_1)]
x[, scaffold_1 := sub("^Scaffold_3$", "zp2", scaffold_1)]
x[, scaffold_1 := sub("^Scaffold_7$", "zp3", scaffold_1)]
x[, scaffold_1 := sub("^Scaffold_9$", "zp4", scaffold_1)]
x[, scaffold_1 := sub("^Scaffold_13$", "zp5", scaffold_1)]
x[, scaffold_1 := sub("^Scaffold_18$", "zp6", scaffold_1)]
x[, scaffold_1 := sub("^Scaffold_48$", "zp7", scaffold_1)]
x[, scaffold_1 := sub("^Scaffold_51$", "zp8", scaffold_1)]
x[, scaffold_1 := sub("^Scaffold_70$", "zp9", scaffold_1)]
x[, scaffold_1 := sub("^Scaffold_93$", "zp10", scaffold_1)]
x[, scaffold_1 := sub("^Scaffold_415$", "zp11", scaffold_1)]
x[, scaffold_1 := sub("^Scaffold_693$", "zp12", scaffold_1)]
x[, scaffold_1 := sub("^Scaffold_1062$", "zp13", scaffold_1)]
x[, scaffold_1 := sub("^Scaffold_1063$", "zp14", scaffold_1)]
x[, scaffold_1 := sub("^Scaffold_1064$", "zp15", scaffold_1)]
x[, scaffold_1 := sub("^Scaffold_1065$", "zp16", scaffold_1)]

# Now do the same for the "scaffold_2" column
x[, scaffold_2 := sub("^Scaffold_1$", "zp1", scaffold_2)]
x[, scaffold_2 := sub("^Scaffold_3$", "zp2", scaffold_2)]
x[, scaffold_2 := sub("^Scaffold_7$", "zp3", scaffold_2)]
x[, scaffold_2 := sub("^Scaffold_9$", "zp4", scaffold_2)]
x[, scaffold_2 := sub("^Scaffold_13$", "zp5", scaffold_2)]
x[, scaffold_2 := sub("^Scaffold_18$", "zp6", scaffold_2)]
x[, scaffold_2 := sub("^Scaffold_48$", "zp7", scaffold_2)]
x[, scaffold_2 := sub("^Scaffold_51$", "zp8", scaffold_2)]
x[, scaffold_2 := sub("^Scaffold_70$", "zp9", scaffold_2)]
x[, scaffold_2 := sub("^Scaffold_93$", "zp10", scaffold_2)]
x[, scaffold_2 := sub("^Scaffold_415$", "zp11", scaffold_2)]
x[, scaffold_2 := sub("^Scaffold_693$", "zp12", scaffold_2)]
x[, scaffold_2 := sub("^Scaffold_1062$", "zp13", scaffold_2)]
x[, scaffold_2 := sub("^Scaffold_1063$", "zp14", scaffold_2)]
x[, scaffold_2 := sub("^Scaffold_1064$", "zp15", scaffold_2)]
x[, scaffold_2 := sub("^Scaffold_1065$", "zp16", scaffold_2)]

# Make a vector identifying each chromosome as it is known to circos
zp_ids <- c("zp1", "zp2", "zp3", "zp4", "zp5", "zp6", "zp7", "zp8", "zp9", "zp10", "zp11", "zp12", "zp13", "zp14", "zp15", "zp16")

# Make the links files
for (i in zp_ids){
y <- x[scaffold_1 == i,]
myfile <- paste0(i, "_links.txt")
write.table(y, file = myfile, row.names = FALSE, col.names = FALSE, quote = FALSE)
}

# I carried this out in RStudio so the files were moved to the circos directory (/home/jkimball/haasx092/circos/200511_version/links)