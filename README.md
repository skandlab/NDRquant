# NDRquant (page under construction)
NDRquant is a method for quantification the content of circulating tumor DNA (ctDNA) in plasma cell-free DNA (cfDNA) based on tissue-specific cfDNA degradation of nucleosome depleted regions (NDR).
### References:
Zhu et al., Tissue-specific cell-free DNA degradation quantifies circulating tumor DNA burden, 2020 (in review).
<p>&nbsp;</p>

## Description
NDRquant is a quantitative method for estimation of ctDNA levels in plasma samples using local tissue-specific cell-free DNA degradation patterns. NDRquant-CRC is quantitative model, based on 6 regulatory regions, that can estimate ctDNA levels in blood plasma from colorectal cancer patients. NDRquant-PAN is a model pased on  10 regulatory regions that is able to estimate ctDNA levels in blood plasma from both breast cancer and colorectal cancer patients. Since the model requires data from 10 or less NDRs, these regions can be profiled at low cost by capturing <25 kb of genomic sequence, potentially enabling quantitative low-cost tracking of ctDNA dynamics and disease progression.
<p>&nbsp;</p>

## Usage Example
The NDRquant workflow comprise the following 2 steps:

### 1. Generating relative coverages of the predictive NDRs.
For a given promoter NDR (-150 to 50bp relative to TSS), the raw coverage is divided by the mean raw coverage of the upstream (-2000 to -1000bp relative to TSS) and downstream (1000 to 2000bp relative to TSS) flanks. A similar approach was used for the first exon-intron junction (NDR, -300 to -100 bp relative to first exon end). The genomic locations of predictive NDRs for the NDRquant-CRC and NDRquant-Pan models are provided in the data folder. The full code for calculating the relative coverage of promoter/junction NDRs is available in the code folder (scripts: "generate-feature-promoter.sh", "generate-feature-junction.sh").
![Alt text](https://github.com/skandlab/NDRquant/blob/main/Data/relative%20coverage.jpg)

#### examples:
For a givin plasma sample from CRC patients, the 6 predictive NDRs ("CRC_NDR.xls") comprises 3 promoter and 3 junction NDRs, and the raw coverages of their NDRs was divided by the mean raw coverage of the upstream and downstream flanks before the calculation of the mean relative coverage per NDR, shown below.
      
      samtools depth -aa -r NDR.site in.bam > NDR.depth
      samtools depth -aa -r Flanks.site in.bam > Flanks.depth
| Gene  | Transcript  | Chr | Site | NDR.site | Flanks.site | Relative coverage |
|:--------:|:--------:|:-----:|:-----:|:---------:|:-----:|:-----:|
| SHKBP1 |ENST00000599716 | 19 | 41082891 | | | |
| ACSL1 |ENST00000454703 | 4 | 185747070 | | | |
| BCAR1 | ENST00000162330 | 16 | 75285369 | | | |
| RAB25 | ENST00000361084 | 1 | 156030951 | | | |
| PRTN3 | ENST00000234347 | 19 | 840960 | | | |
| LSR  | ENST00000605618 | 19 | 35739922 | | | |

### 2. Estimating the ctDNA fractions. 
The ctDNA fraction can be estimated from the relative coverages of the predictive NDRs with linear regression using the trained parameters (data/ folder, "model coefficients.xlsx").
![Alt text](https://github.com/skandlab/NDRquant/blob/main/Data/model%20prediction.jpg)

#### examples:
The ctDNA fraction can be estimated from the calculated relative coverages above:  

<p>&nbsp;</p>


## Method Development
At this stage, NDRquant-CRC and NDRquant-PAN has been developed and benchmarked with whole genome sequencing (WGS) data of plasma samples from healthy donors, colorectal cancer (CRC) and breast cancer (BRCA) patients. The NDRquant-CRC model has been further validated using capture-based sequencing data targeting the 6 NDRs across >50 independent plasma samples from CRC patients. The data used for development and benchmarking of the models is summarized below.

| Model  | No. of NDRs  | WGS data (model development) | Capture data (validation) |
|:-------------:|:-------------:|:-----:|:-----:|
| CRC      | 6  | CRC (n=12), Healthy (n=29)  | CRC (n=53) |
| PAN (multiple cancers) | 10 | CRC (n=12), BRCA (n=10), Healthy (n=29) | N/A - in progress |
<p>&nbsp;</p>



## Data Availability
cfDNA sequencing data have been deposited at the European Genome-phenome Archive (EGA) under the accession code EGAS00001004657. https://ega-archive.org/studies/EGAS00001004657

