cwlVersion: v1.0
class: CommandLineTool
label: "rdfize_refex_sample: Converts a tsv-formatted RefEx sample table to ttl format."
doc: "Converts a tsv-formatted RefEx sample table to ttl format."

hints:
  DockerRequirement:
    dockerPull: shikeda/rdfize_refex

baseCommand: [rdfize_sample.awk]

inputs:
  sample_table_file:
    type: File
    inputBinding:
      position: 50
  output_filename:
    type: string

stdout: $(inputs.output_filename)

outputs:
  sample_ttl:
    type: stdout
