##Description of data and workflow of scripts

* data represents breast cancer gene panel from Otogenetics

* Data files (not included in repo)
	*`~/data/breastCancerRaw`
	index files are for each sample, include mapping, etc
	paired sample files for each individual
	* `~/Dropbox/cancerGenomics/breast`

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

* Scripts (to be run in order listed)
	* `BCgenes.lst` list of genes of interest
	* `sampleNames.lst` list of unique identifier for each sample
	* `nameTrans.lst` list relating library (file) names to sample IDs
	* `sanityCheck.sh` reassess somatic vs germline mutation from variant calls	
	* `breastPrep.sh` extracts results for genes of interest
	* `breastCombine.sh` aggregating data by gene for all patients
	* `breastSummarize.sh` summarizing and comparing analyses of variant calls
	* `breastTable.sh` creating table from variant calls (by individual)
	* `geneFigures.sh` creating gene figures from variant calls 
