cwlVersion: v1.0
class: Workflow

requirements:
  MultipleInputFeatureRequirement: {}

inputs:
  # Inputs for rdfize_refex_eachsample
  eachsample_table_file:
    type: File
  id_uri_prefix:
    type: string?
  id_uri_abbrev:
    type: string?
  eachsample_ttl_filename:
    type: string
    default: eachsample.ttl

  # Inputs for rdfize_refex_sample
  sample_table_file:
    type: File
  sample_ttl_filename:
    type: string
    default: sample.ttl

  # Inputs for cat
  signature_file:
    type: File
  concatenated_filename:
    type: string
    default: catted.ttl

  # Inputs for rapper_ttl2ttl
  final_output_filename:
    type: string

outputs:
  turtle_file:
    type: File
    outputSource: rapper_ttl2ttl/nice_ttl

steps:
  rdfize_refex_eachsample:
    run: rdfize_refex_eachsample.cwl
    in:
      eachsample_table_file: eachsample_table_file
      id_uri_prefix: id_uri_prefix
      id_uri_abbrev: id_uri_abbrev
      output_filename: eachsample_ttl_filename
    out:
      [eachsample_ttl]

  rdfize_refex_sample:
    run: rdfize_refex_sample.cwl
    in:
      sample_table_file: sample_table_file
      output_filename: sample_ttl_filename
    out:
      [sample_ttl]

  cat:
    run: cat.cwl
    in:
      files: [rdfize_refex_eachsample/eachsample_ttl,
      rdfize_refex_sample/sample_ttl,
      signature_file]
      output_filename: concatenated_filename
    out:
      [concatenated_file]

  rapper_ttl2ttl:
    run: rapper_ttl2ttl.cwl
    in:
      turtle_file: [cat/concatenated_file]
      output_filename: final_output_filename
    out:
      [nice_ttl]
