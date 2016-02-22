##README for breast cancer gene data

`~/data/breastCancerRaw`
	index files are for each sample, include mapping, etc
	paired sample files for each individual
	
`~/Dropbox/cancerGenomics/breast`

* `paired_comparison_10262015/`
* `original_report/` paired results for each individual
	* `filtered/` folder for each individual
		* `onTarget` only genes of interest (filtered by coordinate, so includes annotations for other genes)
		* `filtered` quality filtered onTarget data, 10X min
	* `processing/`
		* `processed/` filtered data with only genes of interest
	* `sanityCheck/` one file for each individual, compare somatic/germline, quality filtering?
	* Summary files:
		* `*hits` all annotations (may be multiples for same SNP)
		* `*snps` only unique SNPs
		* snpsFiltered and snpsProcessed should have identical counts