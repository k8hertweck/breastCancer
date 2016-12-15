#!/bin/bash

## assessment of gain and loss in CNVs from probe data

SCRIPT=`pwd`
WORK=~/Dropbox/cancerGenomics/breast

cd $WORK/cnv

# GAIN/LOSS
# gain/loss, default thresholds
cnvkit.py gainloss cnr/*.cnr.txt -s cns/*.cns.txt

# gain/loss, adjusted parameters
-t # threshold, default 0.2, lower threshold for heterogenous samples
-m # number of probes required to call, default 3, raise to decrease false positives
cnvkit.py gainloss cnr/*.cnr.txt -s cns/*.cns.txt -t 0.1 -m 4

# PLOT GAIN/LOSS
# plot target gene on finer scale
cnvkit.py scatter cnr/Index24_OtA9926_Santanu.cnr.txt -g STK11 -o Index24STK11.pdf

# CALL SEGMENT'S ABSOLUTE COPY NUMBER

# call copy number, default parameters
cnvkit.py call cns/*.cns.txt -o cns/*.call.cns.txt

# call copy number, adjusted parameters
cnvkit.py call cns/*.cns.txt -m threshold -t=-1.1,-0.4,0.3,0.7 -o cns/*.call.cns.txt
