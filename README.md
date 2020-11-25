## NDRquant (page under construction)
NDRquant is a method for quantification the content of circulating tumor DNA (ctDNA) in plasma cell-free DNA (cfDNA) based on tissue-specific cfDNA degradation of nucleosome depleted regions (NDR).

# Description
We developed a quantitative method, exploiting local tissue-specific cell-free DNA degradation patterns, that accurately estimates ctDNA burden independent of genomic aberrations. Nucleosome-dependent cfDNA degradation at promoters and first exon-intron junctions was strongly associated with differential transcriptional activity in tumors and blood. A quantitative model, based on just 6 regulatory regions, could accurately predict ctDNA levels in colorectal cancer patients. Strikingly, a model restricted to blood-specific regulatory regions could predict ctDNA levels across both colorectal and breast cancer patients. Since the model requires data from 10 or less NDRs, these regions can be profiled at low cost by capturing <25 kb of genomic sequence, enabling quantitative low-cost tracking of ctDNA dynamics and disease progression.

# Method development
At this stage, NDRquant was developed and benchmarked with whole genome sequencing (WGS) data of plasma samples from healthy donors, colorectal cancer (CRC) and breast cancer (BRCA) patients. The model could accurately predict ctDNA levels in CRC patients based on just 6 NDRs (3 CRC-specific and 3 blood-specific genes), and its robustness has been validated on capture-based sequencing data targeting the 6 NDRs using independent plasma samples from CRC patients. In addition, NDRquant could estimate ctDNA burden in plasma samples across distinct cancer types (CRC+BRCA) using 10 NDRs restricted to blood-specific genes.


# Usage
The NDRquant workflow includes the following 2 steps:

1. Generating relative coverages of the predictive NDRs.

   For a given promoter NDR (-150 to 50bp relative to TSS), the raw coverage was divided by the mean raw coverage of the upstream (-2000 to -1000bp relative to TSS) and downstream (1000 to 2000bp relative to TSS) flanks. A similar approach was used for the first exon-intron junction (NDR, -300 to -100 bp relative to first exon end). At this stage, NDRquant can estimate ctDNA fractions in the plasma samples from CRC patients 6 NDRs


2. Estimating the ctDNA fractions. 
    

# Demo


# References
