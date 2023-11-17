// workflows: combining multiple channels

ch = Channel.of(1,2,3)    // try also  Channel.value(1)  

process GENERIC {
    //directives
    tag 'generic workflow'
    debug true
    container 'docker://ubuntu:20.04' // requires nextflow.config --> singularity.enabled = true
    publishDir 'results_dir', pattern: '*.txt'
    //publishDir 'results_dir', mode: 'copy', pattern: '*.txt'
    cpus 2


    input:
    val x

    output:
    path "myfile_${x}.txt"

    script:
    """
    echo Process \$\$ gets $x with $task.cpus CPUs > myfile_${x}.txt
    cat /etc/os-release >> myfile_${x}.txt
    """
}

workflow {
  ch | GENERIC 
}