cwlVersion: v1.0
class: CommandLineTool
label: "calc_tpm_stats: Calculates basic statistics for TPM values of each sample group."
doc: "Calculates basic statistics for TPM values of each sample group."

hints:
  DockerRequirement:
    dockerPull: shikeda/rdfize_refex

baseCommand: [calc_tpm_stats.awk]

inputs:
  eachsample_table_file:
    type: File
    inputBinding:
      position: 50
  tpm_table_file:
    type: File
    inputBinding:
      position: 60
  entry_id_num:
    type: int
    default: 1
    inputBinding:
      position: 1
      separate: false
      prefix: -ventry_id_num=
  col:
    doc: "The column index of the eachsample table which matches the column name of the TPM table."
    type: int?
    inputBinding:
      position: 2
      separate: false
      prefix: -vcol=
  output_filename:
    type: string

stdout: $(inputs.output_filename)

outputs:
  entry_table:
    type: stdout
