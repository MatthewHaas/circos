# circos
Creating a circos plot for _Zizania palustris_.

The file [colors.ucsc.conf](colors.ucsc.conf) is a configuration file that was taken from the [UCSC (University of California-Santa Cruz) genome browser human chromosome colors](https://genome.ucsc.edu/goldenPath/help/hgTracksHelp.html).

### This section should be moved to the "early_version" directory because that is the only plot for which it is relevant.
Files referenced in the circos configuration file (circos.conf) have been put into sub-directories based on their function.

The karyotype file specifies how long each chromosome is. Chromosomes were shrunk proportionally (by a factor of 23) compared to actual size.

Files that draw links between _Orzya sativa_ and _Zizania palustris_ can be found in the "links" directory.
Files that make heatmaps for retrotransposon (LTR-retrotransposons specifically) density are found in the "retrotransposon" directory.
Files that make heatmaps for SNP density are found in the "snp_density" directory.
### End of section to be moved to "early_version" README.

## 200309_version (directory)
The files contained in this directory are a precursor to the ones in **200511_version**, but are no longer up to date. Like the **early_version** files, these could also be deleted.

## 200511_version (directory)
This directory contains files for the most up-to-date version(s) of the circos plot. In fact, it contains multiple versions (e.g., one for genomic features in _Zizania palustris_, another for repeats only, and another to show the effect of downsampling FASTQ file depth on SNP detection). I chose to not update the directory name.

## early_version (directory)
This directory contains files that pertain to the initial circos plot that I made in the summer of 2019. The main purpose was to get an initial view of the genome while learning how to use circos. Better analyses produced better/more accurate results so the files in this directory should no longer be used. In fact, they could eventually be deleted (especially on the server, to clear up space).
