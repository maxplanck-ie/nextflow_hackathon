ch = Channel.of(1,2,3) 

// Many Operator on channels: 
// view, map, flatten, collect, count, ...
ch.view().map{it**2}.view{"square=$it"}
// ch | view | map{ it**2 } | view{"square=$it"}

// see also:
//Channel.of(4,5,6).set{ ch2 }  // set channel name = ch2
//ch2.view().map{it**2}.view{"square=$it"}