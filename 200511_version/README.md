# README for 200511_version
Scripts written to make the most recent version of the circos plot for the genome paper. Currently, the idea is to have one main circos plot for the genome paper and also make smaller circos plots for the supplementary section with additional details.

## make_LTR_density_files_for_circos.R
This R script reads in the long terminal repeat (LTR) bed file and finds the density of _Gypsy_ and _Copia_ separately (versus LTR elements as a whole, as was done in the 200309 version. There are other types of elements besides _Gypsy_ and _Copia_, but those are grouped into one class called "other". Maybe we will eventually want to break those down into smaller components for the circos plot, but the breakdown is already done in a Supplementary Table for the manuscript--so it may not be necessary.
	
## run_make_LTR_density_files.sh
Shell script that launches the R script _make_LTR_density_files_for_circos.R_
