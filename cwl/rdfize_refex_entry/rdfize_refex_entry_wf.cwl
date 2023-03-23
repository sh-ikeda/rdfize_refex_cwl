cwlVersion: v1.0
class: Workflow

requirements:
  MultipleInputFeatureRequirement: {}

inputs:
  # Inputs for calc_tpm_stats
  eachsample_table_file:
    type: File
  tpm_table_file:
    type: File
  entry_table_filename:
    type: string
  entry_id_num:
    type: int
  col:
    type: int?

  # Inputs for rdfize_refex_entry
  id_uri_prefix:
    type: string
  id_uri_abbrev:
    type: string
  turtle_filename:
    type: string
    default: out.ttl

  # Inputs for cat
  signature_file:
    type: File
  concatenated_filename:
    type: string

outputs:
  turtle_file:
    type: File
    outputSource: cat/concatenated_file
  entry_table:
    type: File
    outputSource: calc_tpm_stats/entry_table

steps:
  calc_tpm_stats:
    run: calc_tpm_stats.cwl
    in:
      eachsample_table_file: eachsample_table_file
      tpm_table_file: tpm_table_file
      output_filename: entry_table_filename
      entry_id_num: entry_id_num
    out:
      [entry_table]

  rdfize_refex_entry:
    run: rdfize_refex_entry.cwl
    in:
      table_file: calc_tpm_stats/entry_table
      id_uri_prefix: id_uri_prefix
      id_uri_abbrev: id_uri_abbrev
      output_filename: turtle_filename
    out:
      [turtle_file]

  cat:
    run: cat.cwl
    in:
      files: [rdfize_refex_entry/turtle_file,
      signature_file]
      output_filename: concatenated_filename
    out:
      [concatenated_file]
