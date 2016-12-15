##Description of data and workflow of scripts

* data represents breast cancer gene panel from Otogenetics

* Data files (not included in repo)
	* `~/data/breastCancerRaw`
	index files are for each sample, include mapping, etc
	paired sample files for each individual
	* `~/Dropbox/cancerGenomics/breast`

	* `paired_comparison_10262015/` (from Otogenetics)
		* `original_report/` paired results for each individual
		* `filtered/` folder for each individual
			* `onTarget` only genes of interest (filtered by coordinate, so includes annotations for other genes)
			* `filtered` quality filtered onTarget data, 10X min
	* `processing/`
		* `target_genes/` somatic/germline calling for only genes of interest from filtered Otogenetics data
		* `somaticCheck/` one file for each individual, compare somatic/germline calling and quality filtering from Otogenetics
		* `summary/`:
			* `*hits` all annotations (may be multiples for same SNP)
			* `*snps` only unique SNPs
			* snpsFiltered and snpsProcessed should have identical counts

* lists that describe data:
	* `BCgenes.lst` list of genes of interest
	* `sampleNames.lst` list of unique identifier for each sample
	* `nameTrans.lst` list relating library (file) names to sample IDs

* Scripts to extract mutations (to be run in order listed)
	* `somaticCheck.sh` reassess somatic vs germline mutation from variant calls	
	* `breastPrep.sh` extracts results for genes of interest
	* `breastCombine.sh` aggregating data by gene for all patients
	* `breastSummarize.sh` summarizing and comparing analyses of variant calls
	* `breastTable.sh` creating table from variant calls (by individual)

* `geneFigures/`
	* `geneFigures.sh` creating gene figures from variant calls (using lollipops); these figures were not used in manuscript
	* `geneFigs.R` creating gene figures from variant calls (using Bioconductor's trackViewer); these figures were used in manuscript

* `mutationFigures/`
	* `combVariants.tsv` combined somatic variants with annotations from all samples
	* `mutations.R` summarizing types of mutations from genes of interest
	