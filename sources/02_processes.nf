params.type='dna' // processes have parameters

// process definition
process SIMPLE {
  // debug true  // or run with -process.debug

  // default script is bash (python, perl, ... also possible)
  script:
  """
  echo Hello bash user \$USER. nextflow params.type: $params.type
  """
}

// process invocation
workflow {
  SIMPLE()
}