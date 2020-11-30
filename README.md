# NDRquant (page under construction)
NDRquant is a method for quantification the content of circulating tumor DNA (ctDNA) in plasma cell-free DNA (cfDNA) based on tissue-specific cfDNA degradation of nucleosome depleted regions (NDR).
<p>&nbsp;</p>

## Description
NDRquant is a quantitative method for estimation of ctDNA levels in plasma samples using local tissue-specific cell-free DNA degradation patterns. NDRquant-CRC is quantitative model, based on 6 regulatory regions, that can estimate ctDNA levels in blood plasma from colorectal cancer patients. NDRquant-PAN is a model pased on  10 regulatory regions that is able to estimate ctDNA levels in blood plasma from both breast cancer and colorectal cancer patients. Since the model requires data from 10 or less NDRs, these regions can be profiled at low cost by capturing <25 kb of genomic sequence, potentially enabling quantitative low-cost tracking of ctDNA dynamics and disease progression.
<p>&nbsp;</p>

## Usage
The NDRquant workflow includes the following 2 steps:

#### 1. Generating relative coverages of the predictive NDRs.
For a given promoter NDR (-150 to 50bp relative to TSS), the raw coverage was divided by the mean raw coverage of the upstream (-2000 to -1000bp relative to TSS) and downstream (1000 to 2000bp relative to TSS) flanks. A similar approach was used for the first exon-intron junction (NDR, -300 to -100 bp relative to first exon end). The information of NDRs is provided ("6 NDRs - CRC.xlsx", "10 NDRs - multiple cancers.xlsx"), and the code for calculating the relative coverage of promoter/junction NDRs can be obtained ("generate-feature-promoter.sh", "generate-feature-junction.sh").
![Alt text](https://github.com/skandlab/NDRquant/blob/main/relative%20coverage.jpg)

#### 2. Estimating the ctDNA fractions. 
The ctDNA fraction can be estimated from the relative coverages of the predictive NDRs with linear regression using the trained parameters ("model coefficients.xlsx").
![Alt text](https://github.com/skandlab/NDRquant/blob/main/model%20prediction.jpg)

<p>&nbsp;</p>

## Method Development
At this stage, NDRquant-CRC and NDRquant-PAN has been developed and benchmarked with whole genome sequencing (WGS) data of plasma samples from healthy donors, colorectal cancer (CRC) and breast cancer (BRCA) patients. The NDRquant-CRC model has been further validated using capture-based sequencing data targeting the 6 NDRs across >50 independent plasma samples from CRC patients. The data available for benchmarking of the models is summarized below.

| Model  | No. of NDRs  | WGS data (model development) | Capture data (validation) |
|:-------------:|:-------------:|:-----:|:-----:|
| CRC      | 6  | CRC (n=12), Healthy (n=29)  | CRC (n=53); Healthy, N/A - in progress |
| PAN (multiple cancers) | 10 | CRC (n=12), BRCA (n=10), Healthy (n=29) | N/A - in progress |
<p>&nbsp;</p>

## Data Availability

XXX Insert EGA Accession / link here XXX

## References
