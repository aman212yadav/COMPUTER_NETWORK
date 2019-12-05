
# creating network simulator object
set ns [new Simulator]  

#defining color for traffic
$ns color 1 Red

# creating object for trace file 
set tr [open "star_topology.tr" w]  
$ns trace-all $tr

set ftr [open "star_topology_out.nam" w]
$ns namtrace-all $ftr


# creating nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
$n0 color red
$n4 color green
$n3 shape box
# creating duplex link between nodes
$ns duplex-link $n0 $n3 2Mb 4ms DropTail
$ns duplex-link $n1 $n3 2Mb 4ms DropTail 
$ns duplex-link $n2 $n3 2Mb 4ms DropTail 
$ns duplex-link $n3 $n4 2Mb 4ms DropTail

#creating TCP agents
set tcp [new Agent/TCP]
set sink [new Agent/TCPSink]

#attaching tcp to node 0 and sink to node 4
$ns attach-agent $n0 $tcp
$ns attach-agent $n4 $sink

#connecting tcp and sink
$ns connect $tcp $sink

#creating FTP application
set ftp [new Application/FTP]

#color to ftp
$tcp set fid_ 1

#attaching ftp to tcp
$ftp attach-agent $tcp


# procedure to close simulator, trace file 
proc finish {} {
   global tr ns ftr
   $ns flush-trace
   close $tr
   close $ftr
   exec nam star_topology_out.nam &
   exit
} 

# defining schedule

$ns at .1 "$ftp start"
$ns at 2.0 "$ftp stop"
$ns at 2.1 "finish"

$ns run
