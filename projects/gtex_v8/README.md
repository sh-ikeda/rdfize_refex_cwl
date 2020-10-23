# RefEx Data processing of GTEx data

## Data download

The expression data and the sample annotation data were downloaded from the [GTEx Portal](https://gtexportal.org/home/datasets).  
- Gene expression data  
  `GTEx_Analysis_2017-06-05_v8_RNASeQCv1.1.9_gene_tpm.gct.gz`

- Sample annotation  
  `GTEx_Analysis_v8_Annotations_SampleAttributesDS.txt`  
  `GTEx_Analysis_v8_Annotations_SubjectPhenotypesDS.txt`

## Processing

The annotation files do not include the BioSample IDs.  
The BioSample IDs of the samples were retrieved on [NCBI BioProject](https://www.ncbi.nlm.nih.gov/bioproject/75899).  
The IDs were mapped to the corresponding GTEx sample IDs based on the BioSample attribute `submitted sample id`.  
The sample annotation file and the sample ID mappings were formatted as the sample grouping table and the sample ID mapping table of RefEx.  

The expression data is provided as a table of TPM values.  
Each row name of the table represents an Ensembl gene ID.  
The GTEx sample IDs of the table were replaced with the BioSample IDs and the table was used as the TPM table of RefEx.  
