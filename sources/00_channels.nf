seq=1..3     // sequence
list=[1,2,3] // list

ch = Channel.of(1,2,3)     // queue channel with 3 elements
//ch = Channel.of(seq)     // same
//ch = Channel.of(list)    // channel with one (1) element (a list)
//ch = Channel.fromList(list) // turn list into elements
//ch = Channel.fromPath('data/**bam', checkIfExists: false)  // sequence of file names

ch | view