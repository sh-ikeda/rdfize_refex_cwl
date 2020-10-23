cwlVersion: v1.0
class: CommandLineTool
label: "rdfize_refex_entry: Converts a tsv-formatted RefEx entry table to turtle format."
doc: "Converts a tsv-formatted RefEx entry table to turtle format."

hints:
  DockerRequirement:
    dockerPull: shikeda/rdfize_refex

baseCommand: [rdfize_entry.awk]

inputs:
  table_file:
    type: File
    inputBinding:
      position: 50
  id_uri_prefix:
    doc: "Prefix of gene IDs' URI. e.g. http://rdf.ebi.ac.uk/resource/ensembl/"
    type: string
    inputBinding:
      position: 1
      separate: false
      prefix: -vid_uri_prefix=
  id_uri_abbrev:
    doc: "Abbreviation of the prefix indicated by id_uri_prefix. e.g. ensembl"
    type: string
    inputBinding:
      position: 2
      separate: false
      prefix: -vid_uri_abbrev=
  output_filename:
    type: string

stdout: $(inputs.output_filename)

outputs:
  turtle_file:
    type: stdout
