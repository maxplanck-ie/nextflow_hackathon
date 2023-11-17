// workflows: combining channels and processes

ch = Channel.of(1,2,3)   // queue channel with 3 elements

process SILLY {
    input:
    val x

    script:
    """
    echo Process \$\$ gets $x 
    """
}

workflow {
  ch | SILLY 
  // ch | collect | SILLY  
}