// workflows and directives
ch = Channel.of(1,2,3)   

process GENERIC {
    //directives
    tag "generic workflow for input $x"
    debug true
    container 'docker://ubuntu:20.04' // requires nextflow.config --> singularity.enabled = true
    publishDir 'results_dir', pattern: '*.txt'                 // this will generate softlinks
    //publishDir 'results_dir', mode: 'copy', pattern: '*.txt'
    cpus 2

    input:
    val x

    output:
    path "myfile_${x}.txt"

    script:
    """
    echo Process \$\$ gets $x with $task.cpus CPUs > myfile_${x}.txt

    # Notice the environment can differ
    # Example: nextflow run sources/workflows3.nf -c nextflow.config 
    # where
    # singularity.enabled = true
    cat /etc/os-release >> myfile_${x}.txt

    # Notice: baseDir = path to nf file
    echo "baseDir ${baseDir}" >> myfile_${x}.txt
    
    # Notice: $baseDir is added to $PATH
    echo \$PATH >> myfile_${x}.txt

    # simple.sh is available in $baseDir/bin/simple.sh
    simple.sh >> myfile_${x}.txt
    """
}

workflow {
  ch | GENERIC
}