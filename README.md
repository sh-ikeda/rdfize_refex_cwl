# rdfize_refex_cwl
CWL tools and workflows to process table data into RefEx RDF

## Input table format

-   TPM table

    Input for `rdfize_refex_entry_wf.cwl`  
    Each row means one gene and each column means one sample. Table values are TPM.  
    The first row indicates BioSample IDs of samples.  
    The first column indicates gene IDs. Any type of ID is allowed.  
    
    Example:
```
	SAMN07187967    SAMN07187968    SAMN07188034
FBgn0265945     0.0     0.0     0.126749
FBgn0265946     0.0     0.0     4.181805
FBgn0265947     0.0     0.0     0.0
FBgn0003187     3.695364        0.628946        0.981611
```
-   sample table

    Input for `rdfize_refex_sample_wf.cwl`
    
    Column 1 : RefEx Sample ID. Begins with "RES".  
    Column 2 : Description. Human-readable description of a sample group.  
    Column 3 : Category. Currently, "tissues", "cell lines", "primary cells", and "stem cells" are allowed.  
    
    Example:
```
RefEx_Sample_ID Description     Category
RES00001615     orgR, abdomen without digestive or reproductive system, female  tissues
RES00001616     orgR, abdomen without digestive or reproductive system, male    tissues
RES00001617     orgR, digestive plus excretory system, female   tissues
RES00001618     orgR, digestive plus excretory system, male     tissues
```
-   eachsample table

    Input for both `rdfize_refex_entry_wf.cwl` and `rdfize_refex_sample_wf.cwl`  
    Each RefEx sample with one RES ID may contain multiple samples which are replicates. "eachsample table" shows samples' BioSample IDs, IDs given by each project, and RES IDs which samples belong to.  
    Statistics of TPM values are calculated for sample groups defined by this table.
    
    Column 1 : RefEx Sample ID.  
    Column 2 : BioSample ID.  
    Column 3 : Project sample ID. IDs given by each project. 
    
    Example:
    (In this example Project sample IDs are GEO sample IDs)
```
RefEx_Sample_ID BioSample_ID    Project_Sample_ID
RES00001615     SAMN07187968    GSM2647254
RES00001615     SAMN07187967    GSM2647255
RES00001615     SAMN07188041    GSM2647256
RES00001616     SAMN07188040    GSM2647257
RES00001616     SAMN07188039    GSM2647258
RES00001616     SAMN07188038    GSM2647259
```

## Input yaml example

- rdfize_refex_sample_wf.yml.sample
```
eachsample_table_file:
  class: File
  path: /path/to/eachsample.tsv
id_uri_prefix: _URI_PREFIX_
id_uri_abbrev: _URI_ABBREV_
sample_table_file:
  class: File
  path: /path/to/sample.tsv
signature_file:
  class: File
  path: /path/to/signature.ttl
final_output_filename: refexsample_project_date.ttl
```
id_uri_prefix is the prefix of project sample IDs' URI.  
e.g. <http://fantom.gsc.riken.jp/5/sstar/FF>:

id_uri_abbrev is Abbreviation of the prefix indicated by id_uri_prefix.  
e.g. ff

These will be output in the turtle as:  
`@prefix ff:      <http://fantom.gsc.riken.jp/5/sstar/FF:> .`

- rdfize_refex_entry_wf.yml.sample
```
eachsample_table_file:
    class: File
    path: /path/to/eachsample.tsv
entry_id_num: _ID_TO_BEGIN_WITH_
entry_table_filename: project_refextable_entry.tsv
id_uri_prefix: _URI_PREFIX_
id_uri_abbrev: _URI_ABBREV_
tpm_table_file:
    class: File
    path: /path/to/tpm.tsv
signature_file:
    class: File
    path: /path/to/signature.ttl
concatenated_filename: refex_project_date.ttl
```
entry_id_num is the number to be given to the first entry as its RFX ID.

id_uri_prefix is the prefix of gene IDs' URI.  
e.g. <http://rdf.ebi.ac.uk/resource/ensembl/>

id_uri_abbrev is Abbreviation of the prefix indicated by id_uri_prefix.  
e.g. ensembl

These will be output in the turtle as:  
`@prefix ensembl: <http://rdf.ebi.ac.uk/resource/ensembl/> .`

