# RefEx Data processing of transcriptome data of rice  

The rice transcriptome data derives from [PRJNA243368](https://www.ncbi.nlm.nih.gov/bioproject/?term=PRJNA243368).  

## Data download

We recalculated the gene expression values from the raw sequence data.  
The files below are required as inputs of the `HISAT2-Stringtie` workflow of Pitagora-cwl.

- Oryza sativa Japonica Group reference genome  
  https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/425/GCF_000005425.2_Build_4.0/  
  `GCF_000005425.2_Build_4.0_genomic.fna.gz`  
- Oryza sativa Japonica Group genome annotation  
  https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/425/GCF_000005425.2_Build_4.0/  
  `GCF_000005425.2_Build_4.0_genomic.gff.gz`  
- SRA Run Table  
  https://www.ncbi.nlm.nih.gov/Traces/study/?acc=PRJNA243368  
  Dowonload `Metadata` for total runs.  

## Processing

The SRA run table was formatted as the sample grouping table and the sample ID mapping table of RefEx.  

The outputs of the `HISAT2-Stringtie` workflow was formatted as the TPM table.
