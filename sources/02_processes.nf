params.type='dna' // processes have parameters

// process definition
process SIMPLE {
  // debug true  // or run with -process.debug

  output:
  path 'myfile.txt'

  // default script is bash (python, perl, ... also possible)
  script:
  """
  echo Hello bash user \$USER. nextflow params.type: $params.type > myfile.txt
  """
}

// process invocation
workflow {
  SIMPLE()
}