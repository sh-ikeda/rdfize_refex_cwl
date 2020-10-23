cwlVersion: v1.0
class: CommandLineTool
label: "rapper_ttl2ttl: Make a turtle file human-friendly by rapper."
doc: "Make a turtle file human-friendly by rapper."

hints:
  DockerRequirement:
    dockerPull: shikeda/raptor

baseCommand: [rapper]

arguments: ["-i", "turtle", "-o", "turtle"]
inputs:
  turtle_file:
    type: File
    inputBinding:
      position: 50
  output_filename:
    type: string

stdout: $(inputs.output_filename)

outputs:
  nice_ttl:
    type: stdout
