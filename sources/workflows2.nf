// workflows: combining multiple channels

ch1 = Channel.of(1,2,3)    // try also  Channel.value(1)  
ch2 = Channel.of('a','b','c','d')   

process SILLY {
    input:
    val x
    val y

    script:
    """
    echo Process \$\$ gets $x and $y 
    """
}

workflow {
  SILLY(ch1, ch2) 
}