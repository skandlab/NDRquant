# NDRquant (page under construction)
NDRquant is a method for quantification the content of circulating tumor DNA (ctDNA) in plasma cell-free DNA (cfDNA) based on tissue-specific cfDNA degradation of nucleosome depleted regions (NDR).

# Description
We developed a quantitative method, exploiting local tissue-specific cell-free DNA degradation patterns, that accurately estimates ctDNA burden independent of genomic aberrations. Nucleosome-dependent cfDNA degradation at promoters and first exon-intron junctions was strongly associated with differential transcriptional activity in tumors and blood. A quantitative model, based on just 6 regulatory regions, could accurately predict ctDNA levels in colorectal cancer patients. Strikingly, a model restricted to blood-specific regulatory regions could predict ctDNA levels across both colorectal and breast cancer patients. Since the model requires data from 10 or less NDRs, these regions can be profiled at low cost by capturing <25 kb of genomic sequence, enabling quantitative low-cost tracking of ctDNA dynamics and disease progression.

# Usage
The NDRquant workflow includes the following 2 steps:

1. Generating relative coverages of the predictive NDRs.
Read coverage at promoter and junction regions was computed from BAM files with SAMtools depth function. For the promoter region (-150 to 50 bp relative to TSS), the mean raw coverage across the region was divided (yielding “relative coverage”) by the mean coverage of the upstream (-2000~-1000 bp relative to TSS) and downstream (1000~2000 bp relative to TSS) flanks. A similar approach was used for the first exon-intron junction. 
    
2. Estimating the ctDNA fractions. 
    

# Demo


# References
