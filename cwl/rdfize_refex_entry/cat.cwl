cwlVersion: v1.0
class: CommandLineTool
label: "cat: Just concatenate files."
doc: "Just concatenate files."

hints:
  DockerRequirement:
    dockerPull: alpine

requirements:
  MultipleInputFeatureRequirement: {}

baseCommand: [cat]

inputs:
  files:
    type: File[]
    inputBinding:
      position: 50
  output_filename:
    type: string

stdout: $(inputs.output_filename)

outputs:
  concatenated_file:
    type: stdout
