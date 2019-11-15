cd ./MIGWAS
chmod +x migwas.py
# Step 1: GWAS summary to gene- and miRNA- level P values
python3 ./minimgnt.py ./example/RA_trans.chr12.pos.P.txt --out RA_trans --cpus 4 --no-rsid
# ****************************************************************
# * minimgnt (miniMAGENTA) ver. 0.9 written by Masahiro Kanai.
# * https://github.com/mkanai/minimgnt
# *
# * MAGENTA was written by Ayellet Segre, Altshuler and Daly Labs.
# * https://www.broadinstitute.org/mpg/magenta/
# ****************************************************************
# 
# Call: ./minimgnt.py ./example/RA_trans.chr12.pos.P.txt --out RA_trans --cpus 4 --no-rsid
# Analysis started at Tue Nov 12 21:08:50 2019
# 
# 20273 genes loaded from ./minimgnt/data/AllHumanGeneChrPosStrandNames_RefSeq_hg19_072111.txt
# 1871 miRNAs loaded from ./minimgnt/data/AllHumanMiRNAChrPosStrandNames_miRBase_hg19_062413.txt
# 
# --remove-HLA: 308 genes and 18 miRNAs were removed.
#               19965 genes and 1853 miRNAs will be used in the following analysis.
# 
# Pruned SNPs loaded from ./minimgnt/data/CEU_HapMap_pruned_SNPs_ChrNumPos_hg19_072111.txt
# Hotspot boundaries loaded from ./minimgnt/data/hotspot_boundaries_b37_hg19_072111.txt
# 
# 465301 SNPs loaded from ./example/RA_trans.chr12.pos.P.txt
# 
# Converted 465301 SNP p-values to z-score (0 SNPs were removed due to NA)
# 
# Calculated uncorrected "gene association score" from best SNP association z-scores per gene
# 20698 out of 21818 genes/mirs were not assigned the score.
# 
# /home/xialab/github_repo/MIGWAS/minimgnt/stepwisefit.py:173: RuntimeWarning: invalid value encountered in true_divide
#   MSexplained = np.divide(SStotal - SSresid, df0)
# Calculated corrected "gene association score" using step-wise multivariate linear regression analysis
# 
# Results were written to RA_trans.{gene, mir}.pval.txt
# 
# Analysis finished at Tue Nov 12 21:09:06 2019.

# Nov 12 21:09 RA_trans.log

# Step 2: MIGWAS analysis for all tissues and specific tissues

python3 ./migwas.py --phenotype RA_trans --out miRA_RA --cpus 16 --iterations 200

# Nov 12 21:20 miRA_RA_migwas_result.txt
# result is NA...
# total cpu is only 12

python3 ./migwas.py --phenotype DIAGRAM_DM --out DIAGRAM_DM --cpus 6 --iterations 200
# Nov 12 21:32 DIAGRAM_DM_migwas_result.txt
# looks okay, not NA

python3 ./migwas.py --phenotype DIAGRAM_DM --out DIAGRAM_DM_CA --cpus 6 --iterations 200 --output-candidate
# these are the results
# -rw-r--r-- 1 xialab xialab 11871 Nov 12 21:39 DIAGRAM_DM_CA_migwas_result.txt
# -rw-r--r-- 1 xialab xialab  6009 Nov 12 21:39 DIAGRAM_DM_CA_candidates.txt


