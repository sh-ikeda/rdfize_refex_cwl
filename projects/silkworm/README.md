# RefEx Data processing of transcriptome data of silkworm  

The silkworm transcriptome data derives from [PRJDB8614](https://www.ncbi.nlm.nih.gov/bioproject/?term=PRJDB8614).  

## Data download

- Gene expression data  
  ftp://ftp.ddbj.nig.ac.jp/ddbj_database/gea/experiment/E-GEAD-000/E-GEAD-315/  
  `GEA_final.tsv` in `E-GEAD-315.processed.zip`  
- Sample annotation  
  ftp://ftp.ddbj.nig.ac.jp/ddbj_database/gea/experiment/E-GEAD-000/E-GEAD-315/  
  `E-GEAD-315.sdrf.txt`

## Processing
The annotation files do not include the BioSample IDs.  
The BioSample IDs of the samples were retrieved on [NCBI BioProject](https://www.ncbi.nlm.nih.gov/bioproject/?term=PRJDB8614).  
The IDs were mapped to the corresponding sample names based on the BioSample attribute `sample name`.  
The sample annotation file and the sample ID mappings were formatted as the sample grouping table and the sample ID mapping table of RefEx.  

The expression data is provided as a table of TPM values.  
The sample names of the table were replaced with the BioSample IDs and the table was used as the TPM table of RefEx.
