# RefEx Data processing of transcriptome data of fruitfly  

The fruitfly transcriptome data derives from [PRJNA388952](https://www.ncbi.nlm.nih.gov/bioproject/?term=PRJNA388952).  
This dataset contains eight *Drosophila* species. We used only the data of *Drosophila melanogaster*.

## Data download

We recalculated the gene expression values from the raw sequence data.  
The files below are required as inputs of the `HISAT2-Stringtie` workflow of Pitagora-cwl.

- Drosophila melanogaster reference genome  
  ftp://ftp.flybase.org/genomes/dmel/dmel_r6.28_FB2019_03/fasta/  
  `dmel-all-chromosome-r6.28.fasta.gz`  
- Drosophila melanogaster genome annotation  
  ftp://ftp.flybase.org/genomes/dmel/dmel_r6.28_FB2019_03/gff/  
  `dmel-all-filtered-r6.28.gff.gz`  
- SRA Run Table  
  https://www.ncbi.nlm.nih.gov/Traces/study/?acc=PRJNA388952&go=go  
  Filter by `fbsp00000001`.  
  Checked the 256 runs and downloaded `Metadata`.  

## Processing

The SRA run table was formatted as the sample grouping table and the sample ID mapping table of RefEx.  

The outputs of the `HISAT2-Stringtie` workflow was formatted as the TPM table.
