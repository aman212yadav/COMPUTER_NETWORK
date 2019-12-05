set marks("computer_networks") 95
set marks("operating_system")  99
set marks("computer_organisation") 93
set size [array size marks]
set totalMarks 0
foreach {subject number} [array get marks] {
    puts "marks in $subject is $number"
    set totalMarks [expr $totalMarks+$number]
}

puts "total marks obtained $totalMarks"
set average  [expr 1.00*$totalMarks/$size]
puts "average marks obtained $average"

if { $average > 90 } {
  puts "Grade A"
} elseif { $average > 60 } {
  puts "Grade B"
} else {
  puts "Grade C"
}
