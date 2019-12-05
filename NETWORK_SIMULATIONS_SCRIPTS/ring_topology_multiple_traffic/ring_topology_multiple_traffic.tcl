
# creating network simulator object
set ns [new Simulator]  

#defining color for traffic
$ns color 1 Red
$ns color 2 blue
# creating object for trace file 
set tr [open "ring_topology_multiple_agent.tr" w]  
$ns trace-all $tr

set ftr [open "ring_topology_multiple_out.nam" w]
$ns namtrace-all $ftr


# creating nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
$n0 color red
$n4 color green

# creating duplex link between nodes
$ns duplex-link $n0 $n1 2Mb 4ms DropTail
$ns duplex-link $n1 $n2 2Mb 4ms DropTail 
$ns duplex-link $n2 $n3 2Mb 4ms DropTail 
$ns duplex-link $n3 $n4 2Mb 4ms DropTail
$ns duplex-link $n4 $n0 2Mb 4ms DropTail

#creating TCP agents
set tcp0 [new Agent/TCP]
set sink0 [new Agent/TCPSink]
set tcp1 [new Agent/TCP]
set sink1 [new Agent/TCPSink]

#attaching tcp to node 0 and sink to node 4
$ns attach-agent $n0 $tcp0
$ns attach-agent $n4 $sink0
$ns attach-agent $n1 $tcp1
$ns attach-agent $n2 $sink1

#connecting tcp and sink
$ns connect $tcp0 $sink0
$ns connect $tcp1 $sink1

#creating FTP application
set ftp [new Application/FTP]
set cbr [new Application/Traffic/CBR]

#color for ftp and udp traffic
$tcp0 set fid_ 1
$tcp1 set fid_ 2

#attaching ftp/cbr to tcp
$ftp attach-agent $tcp0
$cbr attach-agent $tcp1


# procedure to close simulator, trace file 
proc finish {} {
   global tr ns ftr
   $ns flush-trace
   close $tr
   close $ftr
   exec nam ring_topology_multiple_out.nam &
   exit
} 

# defining schedule

$ns at .1 "$ftp start"
$ns at .2 "$cbr start"
$ns at 1.9 "$cbr stop"
$ns at 2.0 "$ftp stop"
$ns at 2.1 "finish"

$ns run
