# RefEx Data processing of FANTOM5 data

## Data download

- Gene expression data  
  The gene expression data were downloaded from the FANTOM5 FTP site.  
  - Human  
    https://fantom.gsc.riken.jp/5/datafiles/reprocessed/hg38_v7/extra/CAGE_peaks_expression/  
    `hg38_fair+new_CAGE_peaks_phase1and2_tpm_ann.osc.txt.gz`  
  - Mouse  
    https://fantom.gsc.riken.jp/5/datafiles/reprocessed/mm10_v7/extra/CAGE_peaks_expression/  
    `mm10_fair+new_CAGE_peaks_phase1and2_tpm_ann.osc.txt.gz`

- Sample annotation  
  The Sample annotation files can be downloaded as the SDRF format from the FANTOM5 FTP site.
  - Human  
    https://fantom.gsc.riken.jp/5/datafiles/reprocessed/hg38_v7/basic/  
    `HumanSamples2.0.sdrf.xlsx`  
  - Mouse  
    https://fantom.gsc.riken.jp/5/datafiles/reprocessed/mm10_v7/basic/  
    `MouseSamples2.3.sdrf.xlsx`  
  The FANTOM5-original annotation files contain mis-annotations and some inconsistencies.  
  We refined the annotations and provide the refined annotation files at https://fantom.gsc.riken.jp/5/datafiles/reprocessed/metadata_latest/

## Processing

The annotation files do not include the BioSample IDs.  
The BioSample IDs of the samples were retrieved on NCBI BioProject ([human](https://www.ncbi.nlm.nih.gov/bioproject/245185), [mouse](https://www.ncbi.nlm.nih.gov/bioproject/245186)).  
The IDs were mapped to the corresponding FANTOM5 sample IDs based on the BioSample attribute `sample name`.  
The sample annotation file and the sample ID mappings were formatted as the sample grouping table and the sample ID mapping table of RefEx.  

The expression data is provided as a table of TPM values.  
The sample names of the table were replaced with the BioSample IDs.  

Each row of the table represents a CAGE peak, mapped to zero or more genes.  
The peaks mapped to no gene were excluded from the table.  
The peaks mapped to multiple genes can not be determined which of the genes' expression the peak actually represent.  
In RefEx, we defined the expression values of such peaks are attributed to all of the genes the peaks mapped to.  

Multiple CAGE peaks can represent the expression of a single gene.  
In RefEx, we defined the added expression value of the peaks representing a single gene represents the gene's expression value.  

For example, assume that the peak A, whose TPM value is 1.0, is mapped to the gene A and B, and the peak B, whose TPM value is 2.0, is mapped only to the gene A.  
Then, we regard that the gene A has 3.0 TPM (from 1.0 of the peak A and 2.0 of the peak B) and the gene B has 1.0 (from only the peak A).  

The original table has multiple columns to represent gene IDs to which peaks map to, i.e., `entrezgene_id`, `hgnc_id`, and `uniprot_id`.  
Our peak annotation is based on `entrezgene_id`, and each row name of the TPM table represents an entrez gene ID.  

The editted expression table was used as the TPM table of RefEx.
