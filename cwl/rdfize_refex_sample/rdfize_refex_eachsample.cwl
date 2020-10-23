cwlVersion: v1.0
class: CommandLineTool
label: "rdfize_refex_sample: Converts a tsv-formatted RefEx eachsample table to ttl format."
doc: "Converts a tsv-formatted RefEx eachsample table to ttl format."

hints:
  DockerRequirement:
    dockerPull: shikeda/rdfize_refex

baseCommand: [rdfize_eachsample.awk]

inputs:
  eachsample_table_file:
    doc: "TSV file of eachsample table."
    type: File
    inputBinding:
      position: 50
  id_uri_prefix:
    doc: "Prefix of project sample IDs' URI. e.g. http://fantom.gsc.riken.jp/5/sstar/FF:"
    type: string?
    inputBinding:
      position: 1
      separate: false
      prefix: -vid_uri_prefix=
  id_uri_abbrev:
    doc: "Abbreviation of the prefix indicated by id_uri_prefix. e.g. ff"
    type: string?
    inputBinding:
      position: 2
      separate: false
      prefix: -vid_uri_abbrev=
  output_filename:
    type: string

stdout: $(inputs.output_filename)

outputs:
  eachsample_ttl:
    type: stdout
