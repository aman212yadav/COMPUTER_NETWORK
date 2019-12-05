# given quadratic coefficient a,b,c of equation ax^2+bx+c .determine nature of roots real or imaginary
set a 1
set b 2
set c 1
set disc [expr $b*$b-4*$a*$c]
if { $disc == 0 } {
   puts "Real and Equal roots"
} elseif { $disc > 0 } {
   puts "Real and Distinct roots"  
} else {
   puts "Imaginary roots"
}
